import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

// rwac5-o67j5-2q2g7-opd6y-adqjx-mg5qf-uv63p-zvzoq-ogsub-luu6d-eae

actor class NFT (name : Text , owner : Principal , content : [Nat8]) = this {
    
    private let itemName = name;
    private var nftOwner = owner;
    private let imageBytes = content;

    public query func getName() : async Text {
        return itemName;
    };

    public query func getOwner() : async Principal {
        return nftOwner;
    };

    public query func getAsset() : async [Nat8] {
        return imageBytes;
    };

    public query func getCanisterId() : async Principal {
        return Principal.fromActor(this);
    };

    public shared(msg) func transferOwnership(newOwner: Principal) : async Text {
        if(msg.caller == nftOwner){
            nftOwner:= newOwner;
            return "Success";
        }else{
            return "Not initiated by NFT owner"
        }
    }

}