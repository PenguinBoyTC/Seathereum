const Migrations = artifacts.require("./Migrations.sol")
const Ownable = artifacts.require("./Ownable.sol")
const AquariumGarden = artifacts.require("./AquariumGarden.sol")
const Ownership = artifacts.require("./Ownership.sol")
const SeabyBreeding = artifacts.require("./SeabyBreeding.sol")

module.exports = (deployer, network) => {
  deployer.then(async () => {
    const migrations = await deployer.deploy(Migrations)
    console.log('Migrations contract deployed at', migrations.address)

    const ownable = await deployer.deploy(Ownable)
    console.log('Ownable contract deployed at', Ownable.address)

    const aquariumGarden = await deployer.deploy(AquariumGarden)
    console.log('AquariumGarden contract deployed at', AquariumGarden.address)

    const ownership = await deployer.deploy(Ownership)
    console.log('Ownership contract deployed at', Ownership.address)

    const seabyBreeding = await deployer.deploy(SeabyBreeding)
    console.log('SeabyBreeding contract deployed at', SeabyBreeding.address)

    // await SeabyBreeding.setSaleAuctionAddress(saleClockAuction.address)
    // await SeabyBreeding.setSiringAuctionAddress(siringClockAuction.address)
    // await SeabyBreeding.setGeneScienceAddress(geneScience.address)
    // await SeabyBreeding.unpause()

    console.log('SeabyBreeding ')
  })
}