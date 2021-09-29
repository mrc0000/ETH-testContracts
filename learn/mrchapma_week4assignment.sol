//Add in solidity programming version
pragma solidity ^0.4.0;

//Create a new smart contract
contract MyStudentContract {
    //Store some data about students
    struct studentAccount {
    //cant make this public defined since its just a structure
    string UserName;
    // address MetaMaskAddress;
    // int Age;
    string Email;
    // ProgramLevel theLevel;
    // bool BlockchainTrackEnrolled;
    }
    enum ProgramLevel
    {
    Freshman, Sophmore, Junior, Senior, Graduate
    }
    
    studentAccount public myNewStudent;
    //creating array of multiple versions of students so I can access all students and make it public
    
    studentAccount [] public allStudents;
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
        }
    //modifier to make sure the calle3r owns the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        
        //underscore is a special scharacter only used inside
        //a function modifier and it tells solidity to
        //execute the rest of the code
        _;
        
    }
    
    event AddedStudents (string studentName);
    
    
    //Create a function to add students - made it public so someone can click on a button and the user can pass on the information
    //anything inside the function only exists in the function and then goes away after running the transaction
    //anything OUTSIDE of the function is global and lives outside on the blockchain
    
    function addStudents (string NewUserName, string NewEmail) public {
    
    //create a local student account and update
    
    studentAccount memory newStudent = studentAccount ({
    UserName:NewUserName,
    Email:NewEmail
    
    //when you create a struct you HAVE to load everything at once
    });
    
    //must save it to a global variables
    allStudents.push(newStudent);
    }
}