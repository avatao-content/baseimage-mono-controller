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
			int result = MainClass.Add(2, 2);
			Assert.AreEqual(4, result);
		}

	}
}

