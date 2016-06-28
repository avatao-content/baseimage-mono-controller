using NUnit.Framework;
using System;

namespace App
{
	[TestFixture ()]
	public class Test
	{

		[Test]
		public void Test_Add()
		{
			int result = MainClass.Add(3, 3);
			Assert.AreEqual(6, result);
		}

		[Test]
		public void Test_Add_2()
		{
			int result = MainClass.Add(0, 0);
			Assert.AreEqual(0, result);
		}

	}
}

