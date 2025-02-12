const hre = require("hardhat");

async function main() {
    const NFT = await hre.ethers.getContractFactory("phNFTv1");
    const nft = await NFT.deploy("phNFTV1", "phv1");

    await nft.waitForDeployment();
    console.log("NFT deployed to:", await nft.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

