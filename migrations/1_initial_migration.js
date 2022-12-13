const deposit = artifacts.require("deposit");

module.exports = function (deployer) {
  deployer.deploy(deposit,"0x14F8C555DC866D86dB5Cb5F6561707bBC5fBB873");
};
