const LandCrowdSale = artifacts.require("LandCrowdSale");
const Business = artifacts.require("Business");


module.exports = async function (deployer) {
  await deployer.deploy(LandCrowdSale);
};
