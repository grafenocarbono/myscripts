#!/bin/bash


RED='\033[0;31m'
NC='\033[0m' #No color
clear
echo -e "${RED}I make no warranty of any kind for the use of this software.\nI am not responsible for any direct or collateral damage."
echo -e "@grafeno30"
echo -e "${NC}Do you agree?(y/n)"
read -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	sudo apt install cargo -y

	read -p "Shall I build you a test project?(y/n) " -n 1 -r
        echo		
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		cargo new hello-rust		
		cd hello-rust
		echo "ferris-says = '0.2'" >> ./Cargo.toml
		cargo build
		cd src
		echo -e '
		use ferris_says::say; \n
		use std::io::{stdout, BufWriter};\n
		\n
		fn main() {\n
		    let stdout = stdout();\n
		    let message = String::from("Hello fellow Rustaceans!");\n
		    let width = message.chars().count();\n

		    let mut writer = BufWriter::new(stdout.lock());\n
		    say(message.as_bytes(), width, &mut writer).unwrap();\n
		}' > main.rs;

		cd ..
		cargo run
	fi;
fi;
