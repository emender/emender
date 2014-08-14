Test1 = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        author = "Pavel Tisnovsky",
        email = "ptisnovs@redhat.com",
        tags = {"XMLcheck", "BasicTest", "SmokeTest"},
    },
    -- any other values are arbitrary
    val = 42}

function Test1:testA()
    print("Test1:testA()")
end

function Test1:testB()
    print("Test1:testB()")
end

function Test1:xyzzy()
    print(self.val)
end

function Test1:foo()
    print("This method should not be called from the tool core!")
end

function Test1:bar()
    self:foo()
end

function Test1:testLocalValue()
    print("Test1:testLocalValue()")
    print(self.val)
end

