module casino::Casino {
    use aptos_framework::coin;
    use aptos_framework::account;
    use aptos_framework::aptos_coin;
    use std::signer;
    use std::vector;
    
    struct Casino {
        owner: signer,
        house_balance: u64,
    }
    
    public fun initialize(owner: &signer) {
        let casino = Casino {
            owner: signer::address_of(owner),
            house_balance: 1_000_000, // Initial casino balance
        };
        move_to(owner, casino);
    }
    
    public fun place_bet(player: &signer, amount: u64): bool {
        let casino = borrow_global_mut<Casino>(signer::address_of(player));
        
        assert!(coin::balance<aptos_coin::AptosCoin>(player) >= amount, 100);
        
        coin::transfer(player, signer::address_of(&casino.owner), amount);
        let result = pseudo_random() % 2; // Simulated 50-50 win/loss
        
        if (result == 1) {
            let winnings = amount * 2;
            coin::transfer(signer::address_of(&casino.owner), player, winnings);
            return true;
        }
        return false;
    }
    
    fun pseudo_random(): u64 {
        let seed = aptos_framework::timestamp::now_microseconds();
        seed % 100 // Simulated randomness
    }
}
