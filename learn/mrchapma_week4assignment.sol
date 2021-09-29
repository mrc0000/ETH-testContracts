//Add in solidity programming version
pragma solidity ^0.4.0;

//Create a new smart contract
contract MyStudentContract {
        //Store some data about students
    enum ProgramLevel{
    Freshman, Sophmore, Junior, Senior, Graduate
    }
        
    struct studentAccount {
            //cant make this public defined since its just a structure
            string UserName;
            address MetaMaskAddress;
            int Age;
            string Email;
            ProgramLevel theLevel;
            bool BlockchainTrackEnrolled;
        }

    //object for holding current user dataq
    studentAccount public myNewStudent;
    //creating array of multiple students
    studentAccount [] public allStudents;
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
        }
        
    //modifier to make sure the caller owns the contract
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
    
    function addStudents (string NewUserName, address NewMetaMaskAddress, int NewAge, string NewEmail,  MyStudentContract.ProgramLevel NewProgramLevel,bool NewBlockchainTrackEnrolled) public {
    
    //create a local student account and update
    
    studentAccount memory newStudent = studentAccount ({
    UserName:NewUserName,
    MetaMaskAddress:NewMetaMaskAddress,
    Age:NewAge,
    Email:NewEmail,
    theLevel:NewProgramLevel,
    BlockchainTrackEnrolled:NewBlockchainTrackEnrolled
    
    
    
    
    //when you create a struct you HAVE to load everything at once
    });
    
    //must save it to a global variables
    allStudents.push(newStudent);
    }
}