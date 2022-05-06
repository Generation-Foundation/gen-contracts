const GenContract = artifacts.require("GenContract");

contract("GenContract", accounts => {
    
    it("should be name, 'Gen Contract'", () =>
        GenContract.deployed()
            .then(instance => instance.method.call.name.call())
            .then(name => {
                assert.equal(
                    name.valueOf(),
                    'Gen Contract',
                    "The name wasn't same 'Gen Contract'"
                );
            }));
            
});