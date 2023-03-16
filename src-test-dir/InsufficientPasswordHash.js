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