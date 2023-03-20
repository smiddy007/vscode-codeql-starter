// This first block is not valid JS (pbkdf2 is not an option for creatHash())
// NodeJS Crypto support pbkdf2 in crypto.pbkdf2()
const crypto = require("crypto");
function hashPassword(password) {
    var hasher = crypto.createHash('pbkdf2');
    var hashed = hasher.update(password).digest("hex"); // BAD
    return hashed;
}

const crypto = require("crypto");
function hashPassword(password) {
    var hasher = crypto.createHash('sha512');
    var hashed = hasher.update(password).digest("hex"); // BAD
    return hashed;
}