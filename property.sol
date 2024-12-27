// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;


contract RealEstate{
    
    struct Property{
        string name;
        uint256 price;
        address owner;
        string location;
        string description;
        bool forsale;
    }
    mapping (uint => Property) public listedProp;
    
    uint256[] public propertyIds;
    event propertySold(uint256 _Id);
 
 function listing(
   uint256 _id,
   string memory _name,
   string memory _location,
   uint256 _price,
   string memory _description
 
  ) public {
  
  Property memory newproperty = Property({
    name: _name,
    price: _price,
    owner: msg.sender,
    location: _location,
    description: _description,
    forsale: true });
 
 listedProp[_id] = newproperty;
 propertyIds.push(_id);
}
 
 
 function buyProperty(uint256 _Id) public payable{
   
  Property storage property = listedProp[_Id];

  require(property.forsale, "Property is not for sale");
  require (property.price ==msg.value, "Your money isn't complete");
  payable(property.owner).transfer(property.price);
   
   property.owner = msg.sender;
   property.price = msg.value;
   property.forsale = false;
  
  
  emit propertySold(_Id);
 }
}