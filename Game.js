import React, { useState } from "react";
import { placeBet } from "../utils";

const Game = ({ playerAddress }) => {
    const [betAmount, setBetAmount] = useState(10);
    const [result, setResult] = useState(null);

    const handleBet = async () => {
        const txHash = await placeBet(playerAddress, betAmount);
        setResult(`Transaction Hash: ${txHash}`);
    };

    return (
        <div>
            <h2>Casino Game</h2>
            <input
                type="number"
                value={betAmount}
                onChange={(e) => setBetAmount(e.target.value)}
            />
            <button onClick={handleBet}>Place Bet</button>
            {result && <p>{result}</p>}
        </div>
    );
};

export default Game;
