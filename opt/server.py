from flask import Flask, jsonify, request
from subprocess import STDOUT, check_output
import subprocess
import os

os.chdir('/nunit/bin')

app = Flask(__name__)

@app.route('/' + os.environ['SECRET'], methods=['POST'])
def solution_check():
    output = ""
    error = ""
    build = ['xbuild', '/home/user/App/App.sln']
    test = ['mono', 'nunit3-console.exe', '/home/user/App/Test/Test.csproj']
    try:
        output = str(check_output(build, stderr=STDOUT))
    except Exception as e:
        return jsonify(solved=False, message="Error while building. \
Make sure, your code doesn't have syntax errors and you have implemented the function!")
    try:
        subprocess.call(test)
        with open('/nunit/bin/TestResult.xml', 'r') as f:
            for line in f.read().splitlines():
                if '<test-case' in line:
                    if line.split('"')[9] == "Failed":
                        error = error + line.split('"')[3] + " FAILED\n"
        if error == "":
            return jsonify(solved=True)
        else:
            return jsonify(solved=False, message=error)
                  
    except Exception as e:
        return jsonify(solved=False, message=str(e))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5555, debug=False)
