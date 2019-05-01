pragma solidity 0.5.4;


library Reporting {
    uint256 private constant DESIGNATED_REPORTING_DURATION_SECONDS = 1 days;
    uint256 private constant DISPUTE_ROUND_DURATION_SECONDS = 7 days;
    uint256 private constant INITIAL_DISPUTE_ROUND_DURATION_SECONDS = 1 days;
    uint256 private constant FORK_DURATION_SECONDS = 60 days;

    uint256 private constant BASE_MARKET_DURATION_MAXIMUM = 30 days; // A market of 30 day length can always
    uint256 private constant UPGRADE_CADENCE = 365 days;
    uint256 private constant INITIAL_UPGRADE_TIMESTAMP = 1626307484; // July 15th 2021

    uint256 private constant INITIAL_REP_SUPPLY = 11 * 10 ** 6 * 10 ** 18; // 11 Million REP

    uint256 private constant DEFAULT_VALIDITY_BOND = 1 ether / 100;
    uint256 private constant VALIDITY_BOND_FLOOR = 1 ether / 100;
    uint256 private constant DEFAULT_REPORTING_FEE_DIVISOR = 100; // 1% fees
    uint256 private constant MAXIMUM_REPORTING_FEE_DIVISOR = 10000; // Minimum .01% fees
    uint256 private constant MINIMUM_REPORTING_FEE_DIVISOR = 3; // Maximum 33.3~% fees. Note than anything less than a value of 2 here will likely result in bugs such as divide by 0 cases.

    uint256 private constant TARGET_INVALID_MARKETS_DIVISOR = 100; // 1% of markets are expected to be invalid
    uint256 private constant TARGET_INCORRECT_DESIGNATED_REPORT_MARKETS_DIVISOR = 100; // 1% of markets are expected to have an incorrect designate report
    uint256 private constant TARGET_DESIGNATED_REPORT_NO_SHOWS_DIVISOR = 20; // 5% of markets are expected to have a no show
    uint256 private constant TARGET_REP_MARKET_CAP_MULTIPLIER = 5; // We multiply and divide by constants since we may want to multiply by a fractional amount
    uint256 private constant TARGET_REP_MARKET_CAP_DIVISOR = 1;

    uint256 private constant AUCTION_INITIAL_REP_PRICE = 15 * 10**18; // Initial REP price for the auction in CASH
    uint256 private constant AUCTION_TARGET_SUPPLY_DIVISOR = 11000; // 1/11000 * supply. The target REP balance to auction off relative to the total supply of tokens
    uint256 private constant AUCTION_INITIAL_PRICE_MULTIPLIER = 4; // Where to start the price of REP and CASH at the beginning of an auction relative to the last discovered price
    uint256 private constant AUCTION_DURATION = 1 days; // Each auction lasts one day

    function getDesignatedReportingDurationSeconds() internal pure returns (uint256) { return DESIGNATED_REPORTING_DURATION_SECONDS; }
    function getInitialDisputeRoundDurationSeconds() internal pure returns (uint256) { return INITIAL_DISPUTE_ROUND_DURATION_SECONDS; }
    function getDisputeRoundDurationSeconds() internal pure returns (uint256) { return DISPUTE_ROUND_DURATION_SECONDS; }
    function getForkDurationSeconds() internal pure returns (uint256) { return FORK_DURATION_SECONDS; }
    function getBaseMarketDurationMaximum() internal pure returns (uint256) { return BASE_MARKET_DURATION_MAXIMUM; }
    function getUpgradeCadence() internal pure returns (uint256) { return UPGRADE_CADENCE; }
    function getInitialUpgradeTimestamp() internal pure returns (uint256) { return INITIAL_UPGRADE_TIMESTAMP; }
    function getDefaultValidityBond() internal pure returns (uint256) { return DEFAULT_VALIDITY_BOND; }
    function getValidityBondFloor() internal pure returns (uint256) { return VALIDITY_BOND_FLOOR; }
    function getTargetInvalidMarketsDivisor() internal pure returns (uint256) { return TARGET_INVALID_MARKETS_DIVISOR; }
    function getTargetIncorrectDesignatedReportMarketsDivisor() internal pure returns (uint256) { return TARGET_INCORRECT_DESIGNATED_REPORT_MARKETS_DIVISOR; }
    function getTargetDesignatedReportNoShowsDivisor() internal pure returns (uint256) { return TARGET_DESIGNATED_REPORT_NO_SHOWS_DIVISOR; }
    function getTargetRepMarketCapMultiplier() internal pure returns (uint256) { return TARGET_REP_MARKET_CAP_MULTIPLIER; }
    function getTargetRepMarketCapDivisor() internal pure returns (uint256) { return TARGET_REP_MARKET_CAP_DIVISOR; }
    function getMaximumReportingFeeDivisor() internal pure returns (uint256) { return MAXIMUM_REPORTING_FEE_DIVISOR; }
    function getMinimumReportingFeeDivisor() internal pure returns (uint256) { return MINIMUM_REPORTING_FEE_DIVISOR; }
    function getDefaultReportingFeeDivisor() internal pure returns (uint256) { return DEFAULT_REPORTING_FEE_DIVISOR; }
    function getInitialREPSupply() internal pure returns (uint256) { return INITIAL_REP_SUPPLY; }
    function getAuctionInitialRepPrice() internal pure returns (uint256) { return AUCTION_INITIAL_REP_PRICE; }
    function getAuctionTargetSupplyDivisor() internal pure returns (uint256) { return AUCTION_TARGET_SUPPLY_DIVISOR; }
    function getAuctionInitialPriceMultiplier() internal pure returns (uint256) { return AUCTION_INITIAL_PRICE_MULTIPLIER; }
    function getAuctionDuration() internal pure returns (uint256) { return AUCTION_DURATION; }
}
