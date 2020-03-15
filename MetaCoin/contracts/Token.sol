pragma solidity ^0.6.1;

import "./ownable.sol";
import  "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";

contract Token is Ownable, ERC721 {

    event NewToken(uint animalId, string name );

    string name;
    int nb_token = 0;

    Token[] public tokens;

    function declareToken(string _name) public {
       uint id = tokens.push(declareToken(_name)) - 1;
       emit NewToken(id, _name);
       nb_token = nb_token + 1;
    }
 
}
