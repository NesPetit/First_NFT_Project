pragma solidity ^0.6.0;
import "./ERC721.sol";

contract Contrat is ERC721{

    uint256 private _index = 0;
	
    address payable private _owner;
    address private contrat = address(this);

    constructor()public{
        _owner = msg.sender;
    }

    function mintToken() public payable {
        require(msg.value >= 0.1 ether);
        _mint(msg.sender, _index);
        _index = _index + 1;
    }

    function receiveEther() public payable {
		require(msg.sender == _owner);
        _owner.transfer(contrat.balance);
    }
}