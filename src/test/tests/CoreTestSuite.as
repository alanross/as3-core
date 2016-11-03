package tests
{
	import tests.core.utils.TestUtilsArrayUtil;
	import tests.core.utils.TestUtilsClassOf;
	import tests.core.utils.TestUtilsDictUtil;
	import tests.core.utils.TestUtilsGetClassName;
	import tests.core.utils.TestUtilsNumberUtils;
	import tests.core.utils.TestUtilsStringUtils;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public final class CoreTestSuite
	{
		// utils
		public var tu01:TestUtilsStringUtils;
		public var tu02:TestUtilsArrayUtil;
		public var tu03:TestUtilsClassOf;
		public var tu04:TestUtilsNumberUtils;
		public var tu05:TestUtilsGetClassName;
		public var tu06:TestUtilsDictUtil;
	}
}