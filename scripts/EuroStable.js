const hre = require("hardhat");

async function main() {
    const SC = await hre.ethers.getContractFactory("EuroStable");
    const sc = await SC.deploy();

    await sc.waitForDeployment();
    console.log("SC deployed to: ", await sc.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});