import React, { useState } from "react";
import { connectWallet } from "../utils";

const Wallet = ({ setAddress }) => {
    return (
        <div>
            <button onClick={() => connectWallet(setAddress)}>Connect Petra Wallet</button>
        </div>
    );
};

export default Wallet;
