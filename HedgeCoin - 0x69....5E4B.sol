/**
 *Submitted for verification at BscScan.com on 2024-06-11
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

}


// File @openzeppelin/contracts/access/Ownable.sol@v5.0.2

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)

//pragma solidity ^0.8.23;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}


// File @openzeppelin/contracts/interfaces/draft-IERC6093.sol@v5.0.2

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (interfaces/draft-IERC6093.sol)
//pragma solidity ^0.8.23;

/**
 * @dev Standard ERC20 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC20 tokens.
 */
interface IERC20Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC20InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC20InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `spender`’s `allowance`. Used in transfers.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     * @param allowance Amount of tokens a `spender` is allowed to operate with.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC20InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `spender` to be approved. Used in approvals.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC20InvalidSpender(address spender);
}

/**
 * @dev Standard ERC721 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC721 tokens.
 */
interface IERC721Errors {
    /**
     * @dev Indicates that an address can't be an owner. For example, `address(0)` is a forbidden owner in EIP-20.
     * Used in balance queries.
     * @param owner Address of the current owner of a token.
     */
    error ERC721InvalidOwner(address owner);

    /**
     * @dev Indicates a `tokenId` whose `owner` is the zero address.
     * @param tokenId Identifier number of a token.
     */
    error ERC721NonexistentToken(uint256 tokenId);

    /**
     * @dev Indicates an error related to the ownership over a particular token. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param tokenId Identifier number of a token.
     * @param owner Address of the current owner of a token.
     */
    error ERC721IncorrectOwner(address sender, uint256 tokenId, address owner);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC721InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC721InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param tokenId Identifier number of a token.
     */
    error ERC721InsufficientApproval(address operator, uint256 tokenId);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC721InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC721InvalidOperator(address operator);
}

/**
 * @dev Standard ERC1155 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC1155 tokens.
 */
interface IERC1155Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     * @param tokenId Identifier number of a token.
     */
    error ERC1155InsufficientBalance(address sender, uint256 balance, uint256 needed, uint256 tokenId);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC1155InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC1155InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param owner Address of the current owner of a token.
     */
    error ERC1155MissingApprovalForAll(address operator, address owner);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC1155InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC1155InvalidOperator(address operator);

    /**
     * @dev Indicates an array length mismatch between ids and values in a safeBatchTransferFrom operation.
     * Used in batch transfers.
     * @param idsLength Length of the array of token identifiers
     * @param valuesLength Length of the array of token amounts
     */
    error ERC1155InvalidArrayLength(uint256 idsLength, uint256 valuesLength);
}


// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v5.0.2

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)

//pragma solidity ^0.8.23;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}


// File @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol@v5.0.2

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/extensions/IERC20Metadata.sol)

//pragma solidity ^0.8.23;

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}


// File @openzeppelin/contracts/token/ERC20/ERC20.sol@v5.0.2

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/ERC20.sol)

//pragma solidity ^0.8.23;




/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * The default value of {decimals} is 18. To change this, you should override
 * this function so it returns a different value.
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 */
abstract contract ERC20 is Context, IERC20, IERC20Metadata, IERC20Errors {
    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the default value returned by this function, unless
     * it's overridden.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `value`.
     */
    function transfer(address /*to*/, uint256 /*value*/) public virtual returns (bool) {
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `value` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, value);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `value`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `value`.
     */
    function transferFrom(address /*from*/, address /*to*/, uint256 /*value*/) public virtual returns (bool) {
        return true;
    }



    /**
     * @dev Transfers a `value` amount of tokens from `from` to `to`, or alternatively mints (or burns) if `from`
     * (or `to`) is the zero address. All customizations to transfers, mints, and burns should be done by overriding
     * this function.
     *
     * Emits a {Transfer} event.
     */
    function _update(address from, address to, uint256 value) internal virtual {
        if (from == address(0)) {
            // Overflow check required: The rest of the code assumes that totalSupply never overflows
            _totalSupply += value;
        } else {
            uint256 fromBalance = _balances[from];
            if (fromBalance < value) {
                revert ERC20InsufficientBalance(from, fromBalance, value);
            }
            unchecked {
                // Overflow not possible: value <= fromBalance <= totalSupply.
                _balances[from] = fromBalance - value;
            }
        }

        if (to == address(0)) {
            unchecked {
                // Overflow not possible: value <= totalSupply or value <= fromBalance <= totalSupply.
                _totalSupply -= value;
            }
        } else {
            unchecked {
                // Overflow not possible: balance + value is at most totalSupply, which we know fits into a uint256.
                _balances[to] += value;
            }
        }

        emit Transfer(from, to, value);
    }



    /**
     * @dev Sets `value` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     *
     * Overrides to this logic should be done to the variant with an additional `bool emitEvent` argument.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        _approve(owner, spender, value, true);
    }

    /**
     * @dev Variant of {_approve} with an optional flag to enable or disable the {Approval} event.
     *
     * By default (when calling {_approve}) the flag is set to true. On the other hand, approval changes made by
     * `_spendAllowance` during the `transferFrom` operation set the flag to false. This saves gas by not emitting any
     * `Approval` event during `transferFrom` operations.
     *
     * Anyone who wishes to continue emitting `Approval` events on the`transferFrom` operation can force the flag to
     * true using the following override:
     * ```
     * function _approve(address owner, address spender, uint256 value, bool) internal virtual override {
     *     super._approve(owner, spender, value, true);
     * }
     * ```
     *
     * Requirements are the same as {_approve}.
     */
    function _approve(address owner, address spender, uint256 value, bool emitEvent) internal virtual {
        if (owner == address(0)) {
            revert ERC20InvalidApprover(address(0));
        }
        if (spender == address(0)) {
            revert ERC20InvalidSpender(address(0));
        }
        _allowances[owner][spender] = value;
        if (emitEvent) {
            emit Approval(owner, spender, value);
        }
    }

    /**
     * @dev Updates `owner` s allowance for `spender` based on spent `value`.
     *
     * Does not update the allowance value in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Does not emit an {Approval} event.
     */
    function _spendAllowance(address owner, address spender, uint256 value) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            if (currentAllowance < value) {
                revert ERC20InsufficientAllowance(spender, currentAllowance, value);
            }
            unchecked {
                _approve(owner, spender, currentAllowance - value, false);
            }
        }
    }
}


contract HedgeCoin is ERC20, Ownable {

    mapping (address => uint256) public rOwned;
    mapping (address => uint256) public tOwned;
    uint256 public constant _tTotal = 40 * 10**6 * 10**18;
    uint256 public immutable qInit;
    uint256 public q;
    mapping (address => bool) public isExcluded;
    mapping (address => int256) private fee;
    uint256 public defaultAStkFee;
    uint256 public  te;
    uint256 public tn;
    uint256 public rTotal;
    uint256 private immutable rQuemado;
    mapping(address => int256) private devFee;
    uint256 public defaultDevFee;
    address public devWallet;
    uint256 public ingreso;
    uint256 public constant MAX_TOKENS = 20 * 1e6;

    event Burn(address indexed sender, uint256 taxPaid);
    event SetDefaultAStkFeeEvent(address indexed _sender, uint256 _defaultAStkFee);
    event SetDevFeeEvent(address indexed _sender,address _devWallet, int256 _DevFee);
    event SetDefaultDevFeeEvent(address indexed _sender, uint256 _defaultDevFee);
    event SetDevWalletEvent(address indexed _sender, address _devWallet);
    event SetAStkFeeEvent(address indexed _sender,address addr, bool isExcluded, int256 _fee);

    constructor(address _ownerToken) ERC20("HedgeCoin", "HDGC") Ownable(_ownerToken) { 
        require(_ownerToken!=address(0x0),"null address not allowed");
        tn = _tTotal;
        rTotal = _tTotal;
        defaultAStkFee = 100;
        defaultDevFee = 25;
        devWallet = _ownerToken;
        _update(address(0), _ownerToken,  MAX_TOKENS * (10**decimals()) );
        rOwned[_ownerToken] = MAX_TOKENS * (10**decimals());
        rQuemado = MAX_TOKENS * (10**decimals());
        tOwned[_ownerToken] = MAX_TOKENS * (10**decimals());
        q= 1 * (10**decimals());
        qInit = q;
    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal - tokenFromReflection(rQuemado);
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (isExcluded[account]) return tOwned[account];
        return tokenFromReflection(rOwned[account]);
    }

    function tokenFromReflection(uint256 rAmount) public view returns(uint256) {
        require(rAmount <= rTotal, "Amount < total reflections");
        rAmount *= qInit;
        rAmount /= q;
        return rAmount;
    } 

    function aStkFee(address addr) external view returns(uint256 _fee){
         if (isExcluded[addr]){
            _fee = uint256(fee[addr]);
            if(_fee>10000){
                _fee=0;
            }
         }else{
            int256 __fee = fee[addr];
            if(__fee == 0) {
                __fee = int256(defaultAStkFee); 
            }
            if(__fee < 0){
                __fee = 0;
            }
            _fee = uint256(__fee);
         }
         return (_fee);
    }

    function readDevFee(address addr) public view returns(uint256) {
        int value = devFee[addr];
        if(value<0) {
            return 0;
        }
        if(value!=0) {
            return(uint256(value));
        } else {
            return(defaultDevFee);
        }
    }

    function estAStkFee(address addr) external view returns(int256) {
        return fee[addr];
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        _transferR(_msgSender(), to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, value);
        _transferR(from, to, value);
        return true;
    }

    function _getTransferFee(address msgSender) internal view returns(uint256) {
        if (!isExcluded[msgSender]) {
            int256 _fee = fee[msgSender];
            if(_fee == 0) {
                _fee = int256(defaultAStkFee); 
            } else if(_fee < 0){
                _fee = 0;
            }       
            return(uint256(_fee));
        } else {
            uint256 _fee = uint256(fee[msgSender]);
            if(_fee>10000){
                _fee=0;
            }
            return(uint256(_fee));
        }
    }

    function _transferStandard(address sender, address recipient, uint256 tAmount) private {
        address msgSender = _msgSender();
        uint256 _fee = _getTransferFee(msgSender);
        uint256 rAmount = tAmount * q; //10000

        uint256 rfee = uint256(_fee) * rAmount; // 100
        rfee = rfee / 10000;
        rfee = rfee / qInit;
        uint256 rDev = readDevFee(msgSender) * rAmount; // 0
        rDev = rDev / 10000;
        rDev = rDev / qInit;

        rAmount = rAmount / qInit;

        rOwned[sender] -= rAmount; // 19.990.000
        rAmount -= (rfee + rDev); //  9900
        rOwned[recipient] += rAmount; // 9900
        rTotal -= rfee; // 39.999.900
        rOwned[devWallet] += rDev; // 0
        q = qInit * rTotal; // 0.9999975
        q = q / tn;

        emit Transfer(sender, recipient, tAmount);
    }

    function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {
        address msgSender = _msgSender();
        uint256 _fee = _getTransferFee(msgSender);
        uint256 rAmount = tAmount * q; //10k

        uint256 tDev = readDevFee(msgSender) * rAmount; // 0
        rAmount = rAmount / qInit; //10k
        uint256 rDev = tDev / qInit;
        tDev = tDev / q;   
        tDev = tDev / 10000;      
        rDev = rDev / 10000;
        uint256 tfee = uint256(_fee) * tAmount;// 100
        tfee = tfee / 10000;
        uint256 transferRealAmount = tAmount - tfee - tDev;  // 10k-100 = 9900
        tOwned[recipient] +=  transferRealAmount; // 9900
        if(isExcluded[devWallet]){ // devWallet es excluida
            tn -= tAmount - tfee; // le resto el tAmount pero le sumo los fees que ganan = 39.990.100
             te += tAmount - tfee; // le sumo el amount y le resto el fee que se reparte
            rTotal -= rAmount;
        }else{ // devWallet no es excluida
            tn -= tAmount - (tfee+tDev); // le resto tAmount, le sumo los fees y el dev fee
             te += transferRealAmount; // le sumo tAmount pero le resto los dos fees
            rTotal -= rAmount - rDev;
        } // rTotal = 39.990.000
        rOwned[sender] -= rAmount; // 19.990.000
        rOwned[devWallet] += rDev; // 0
        q = qInit * rTotal;
        q = q / tn; // 39.990.000/39.990.100 = 0.999997499
        emit Transfer(sender, recipient, transferRealAmount);
        emit Transfer(sender, devWallet, tDev);
        emit Burn(sender,tfee);
    }

    function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {
        address msgSender = _msgSender();
        uint256 _fee = _getTransferFee(msgSender);

        uint256 tFee = _fee * tAmount;
        uint256 rFee = tFee * q;
        tFee = tFee / 10000;
        rFee = rFee / 10000;

        rFee = rFee / qInit; 
        uint256 rAmount = tAmount * q;
        uint256 rDev = readDevFee(msgSender) * rAmount; //0
        rDev = rDev / qInit;
        rAmount = rAmount / qInit;
        rDev = rDev / 10000;
        rAmount -= rFee; // 9975
         te -= tAmount;
        tn += tAmount;
        rTotal += rAmount;
        tOwned[sender] -= tAmount; // 0
        rOwned[recipient] += rAmount - rDev; //9975
        rOwned[devWallet] += rDev; //0
        q = qInit * rTotal;
        q = q  / tn;
        emit Transfer(sender, recipient, tAmount);
    }

    function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {
        tOwned[sender] -= tAmount;
        tOwned[recipient] += tAmount;
        emit Transfer(sender, recipient, tAmount);
    }

    function _transferR(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from 0 address");
        require(recipient != address(this), "ERC20: transfer to SC");
        require(amount > 0, "Transfer amount > zero");
        if (isExcluded[sender] && !isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!isExcluded[sender] && isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!isExcluded[sender] && !isExcluded[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (isExcluded[sender] && isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }
    }

    function _update(address from, address to, uint256 value) internal override(ERC20){
        super._update(from, to, value);
    }

    function setDefaultAStkFee(uint256 value) external onlyOwner() {
        require(value<=100,"AStkFee can't be more than 1%");
        defaultAStkFee = value;
        emit SetDefaultAStkFeeEvent(_msgSender(), value);
    }

    function setDevFee(address addr, int256 value) external onlyOwner() {
        require(value <= 25, "devFee can't be more than 0.25%");
        devFee[addr] = value;
        emit SetDevFeeEvent(_msgSender(),addr, value);
    }

    function setDefaultDevFee(uint256 value) external onlyOwner() {
        require(value <= 25, "defaultdevFee can't be more than 0.25%");
        defaultDevFee = value;
        emit SetDefaultDevFeeEvent(_msgSender(), value);
    }

    function setDevWallet(address addr) onlyOwner() external{
        require(addr != address(0x0),"null address not allowed");
        devWallet = addr;
        emit SetDevWalletEvent(_msgSender(), addr);
    }

    function setAStkFee(address addr, bool shouldBeExcluded, int256 stkFee) external onlyOwner {
        require(stkFee<=100,"StkFee can't be more than 1%");
        if(isExcluded[addr]!=shouldBeExcluded) {
            uint256 fund = balanceOf(addr);
            isExcluded[addr] = shouldBeExcluded;
            if(shouldBeExcluded) {
                if(stkFee<0){
                    stkFee=0;
                }
                tn -= fund;
                 te += fund;
                tOwned[addr] = fund;
                rTotal -= (fund * q) / qInit;
                ingreso = fund;
            }else {
                tn += fund;
                 te -= fund;
                uint256 auxrOwned = (fund * q) / qInit;
                rOwned[addr] = auxrOwned;
                rTotal += auxrOwned;
                ingreso = 0;
            }
        } else {
            ingreso = 1;
        }
        fee[addr] = stkFee;
        emit SetAStkFeeEvent(_msgSender(),addr, shouldBeExcluded, stkFee);
    }

}