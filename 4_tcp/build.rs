use std::{
    env::{self, VarError},
    fs::File,
    io::{self, Write},
};

extern crate rand;

#[derive(Debug)]
enum Error {
    FlagNotFound,
    IOError,
}

impl From<VarError> for Error {
    fn from(_value: VarError) -> Self {
        Self::FlagNotFound
    }
}

impl From<io::Error> for Error {
    fn from(_value: io::Error) -> Self {
        Self::IOError
    }
}

fn main() -> Result<(), Error> {
    println!("cargo:rerun-if-env-changed=FLAG");
    let flag = env::var("FLAG")?;

    let mut fd = File::create("src/flag.rs")?;
    fd.write(
        r#"#[inline(always)]
pub fn get_flag() -> Vec<u8> {
    let mut flag = "EXAM{48564e3d6e272ccde24733285a85979f}".as_bytes().to_vec();
    (0..64).step_by(4).for_each(|x| {
        let idx = 5 + (x / 2);
        let b = format!("{:02x}", X[x]);
        flag[idx] = b.as_bytes()[0];
        flag[idx + 1] = b.as_bytes()[1];
    });
    flag
}

static X: [u8; 64] = [

"#
        .as_bytes(),
    )?;
    for i in 0..64 {
        if i % 4 == 0 {
            let idx = 5 + (i / 2);
            let var = u8::from_str_radix(&flag[idx..idx + 2], 16).expect("hex data");
            write!(fd, "{}", var)?;
        } else {
            write!(fd, "{}", rand::random::<u8>())?;
        }
        if i != 63 {
            fd.write(b",")?;
        } else {
            fd.write(b"];\n\n")?;
        }
    }
    Ok(())
}
