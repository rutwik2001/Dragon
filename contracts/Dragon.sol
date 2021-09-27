// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Dragon{
    struct dragon{
        uint air;
        uint water;
        uint earth;
        uint fire;
        uint light;
        uint dark;
        string typeOfDragon;
        uint value;
    }
    
    
    mapping(uint => dragon) public _Dragon;
    mapping(address => uint[]) public MyDragons;
    uint public index;
    
    function createDragon(uint _air, uint _water, uint _earth, uint _fire, uint _light, uint _dark, string memory _typeOfDragon, uint _value) public {
        _Dragon[index].air = _air;
        _Dragon[index].water = _water;
        _Dragon[index].earth = _earth;
        _Dragon[index].fire = _fire;
        _Dragon[index].light = _light;
        _Dragon[index].dark = _dark;
        _Dragon[index].typeOfDragon = _typeOfDragon;
        _Dragon[index].value = _value;
        index++;
    }
    
    function buyDragon(uint dragonIndex) public payable {
        require(dragonIndex <= index,"The dragon is not created");
        require(msg.value == _Dragon[dragonIndex].value, "Enter the correct amount");
        MyDragons[msg.sender].push(dragonIndex);
    }
    
    function MyDragonIndexes(address player) public view returns (uint[] memory) {
        return MyDragons[player];
    }
    
    function train(uint dragonIndex) public {
        if (_Dragon[dragonIndex].air > 0){
            _Dragon[dragonIndex].air++;
        } else if (_Dragon[dragonIndex].water > 0){
            _Dragon[dragonIndex].water++;
        } else if (_Dragon[dragonIndex].earth > 0){
            _Dragon[dragonIndex].earth++;
        } else if (_Dragon[dragonIndex].fire > 0){
            _Dragon[dragonIndex].fire++;
        } else if (_Dragon[dragonIndex].light > 0){
            _Dragon[dragonIndex].light++;
        } else {
            _Dragon[dragonIndex].dark++;
        }
    }
    
    function breed(uint dragonIndex1, uint dragonIndex2) public {
        if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].air > 0){
            createDragon(2, 0, 0, 0, 0, 0, 'Air', 100 );
        } else if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].earth > 0){
            createDragon(1, 0, 1, 0, 0, 0, 'Sand', 100);
        } else if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].fire > 0){
            createDragon(1, 0, 0, 1, 0, 0, 'Smoke', 100);
        } else if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].water > 0){
            createDragon(1, 1, 0, 0, 0, 0, 'Cloud', 100);
        } else if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].light > 0){
            createDragon(1, 0, 0, 0, 1, 0, 'Lightening', 100);
        } else if (_Dragon[dragonIndex1].air > 0 && _Dragon[dragonIndex2].dark > 0){
            createDragon(1, 0, 0, 0, 0, 1, 'Plague', 100);
        } else if (_Dragon[dragonIndex1].water > 0 && _Dragon[dragonIndex2].earth > 0){
            createDragon(0, 1, 1, 0, 0, 0, 'Mud', 100);
        } else if (_Dragon[dragonIndex1].water > 0 && _Dragon[dragonIndex2].dark > 0){
            createDragon(0, 1, 0, 0, 0, 1, 'Blood', 100);
        } else if (_Dragon[dragonIndex1].water > 0 && _Dragon[dragonIndex2].light > 0){
            createDragon(0, 1, 0, 0, 1, 0, 'Mirror', 100);
        } else if (_Dragon[dragonIndex1].water > 0 && _Dragon[dragonIndex2].water > 0){
            createDragon(0, 2, 0, 0, 0, 0, 'Water', 100);
        } else if (_Dragon[dragonIndex1].water > 0 && _Dragon[dragonIndex2].fire > 0){
            createDragon(0, 1, 0, 1, 0, 0, 'Acid', 100);
        } else if (_Dragon[dragonIndex1].earth > 0 && _Dragon[dragonIndex2].fire > 0){
            createDragon(0, 0, 1, 1, 0, 0, 'Magma', 100);
        } else if (_Dragon[dragonIndex1].earth > 0 && _Dragon[dragonIndex2].light > 0){
            createDragon(0, 0, 1, 0, 1, 0, 'Life', 100);
        } else if (_Dragon[dragonIndex1].earth > 0 && _Dragon[dragonIndex2].dark > 0){
            createDragon(0, 0, 1, 0, 0, 1, 'Petrification', 100);
        }  else if (_Dragon[dragonIndex1].earth > 0 && _Dragon[dragonIndex2].earth > 0){
            createDragon(0, 0, 2, 0, 0, 0, 'Earth', 100);
        } else if (_Dragon[dragonIndex1].fire > 0 && _Dragon[dragonIndex2].light > 0){
            createDragon(0, 0, 0, 1, 1, 0, 'Flare', 100);
        } else if (_Dragon[dragonIndex1].fire > 0 && _Dragon[dragonIndex2].dark > 0){
            createDragon(0, 0, 0, 1, 0, 1, 'Vice', 100);
        } else if (_Dragon[dragonIndex1].light > 0 && _Dragon[dragonIndex2].dark > 0){
            createDragon(0, 0, 0, 0, 1, 1, 'Illusion', 100);
        }
        
    }


}