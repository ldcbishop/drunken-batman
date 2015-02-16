from io       import StringIO
from unittest import main, TestCase

from Netflix import foo

# -----------
# TestNetflix
# -----------

class TestNetflix (TestCase) :
    def test_foo(self):
    	x = foo()
    	self.assertEqual(x,1)

# ----
# main
# ----

if __name__ == "__main__" :
    main()