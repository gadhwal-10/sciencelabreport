import { Aptos } from "@aptos-labs/aptos-sdk";
const aptos = new Aptos("https://fullnode.devnet.aptoslabs.com");

export async function connectWallet(setAddress) {
    if (window.aptos) {
        try {
            const response = await window.aptos.connect();
            setAddress(response.address);
        } catch (err) {
            console.error("Wallet Connection Error:", err);
        }
    } else {
        alert("Please install Petra Wallet!");
    }
}

export async function placeBet(playerAddress, amount) {
    try {
        const payload = {
            function: "casino::Casino::place_bet",
            type_arguments: [],
            arguments: [amount],
        };
        const response = await window.aptos.signAndSubmitTransaction(payload);
        return response.hash;
    } catch (err) {
        console.error("Bet Placement Failed:", err);
    }
}
