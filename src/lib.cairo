#[starknet::interface]
trait Il0xRockContract<TContractState> {
    fn set(ref self: TContractState, x: u128);
    fn get(self: @TContractState) -> u128;
}

// My First Smart Contract
#[starknet::contract]
mod l0xRockContract {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        stored_data: u128
    }

    #[external(v0)]
    impl l0xRockContract of super::Il0xRockContract<ContractState> {
        fn set(ref self: ContractState, x: u128) {
            self.stored_data.write(x);
        }
        fn get(self: @ContractState) -> u128 {
            self.stored_data.read()
        }
    }
}
