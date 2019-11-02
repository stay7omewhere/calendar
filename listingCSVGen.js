const fs = require ('fs');
var faker = require('faker');

const writeUsers = fs.createWriteStream('ListingData2.csv');
writeUsers.write('id,listing_name,mon_min,tue_min,wed_min,thu_min,fri_min,sat_min,sun_min,max_stay\n','utf8');

function writeTenMillionUsers(writer, encoding, callback) {
    let i = 100;
    let id = 0;
    function write () {
        let ok = true;
        do {
            i -= 1;
            id += 1;
            const listing_name = faker.address.streetName();
            const mon_min = Math.floor(Math.random() * 3);
            const tue_min = Math.floor(Math.random() * 3);
            const wed_min = Math.floor(Math.random() * 3);
            const thu_min = Math.floor(Math.random() * 3);
            const fri_min = Math.floor(Math.random() * 5);
            const sat_min = Math.floor(Math.random() * 5);
            const sun_min = Math.floor(Math.random() * 5);
            const max_stay = Math.floor(Math.random() * (35 - 7) + 7);
            const data = `${id}, ${listing_name}, ${mon_min}, ${tue_min}, ${wed_min}, ${thu_min}, ${fri_min}, ${sat_min}, ${sun_min}, ${max_stay}\n`;
            if (i === 0) {
                writer.write(data, encoding, callback);
            } else {
                ok = writer.write(data, encoding);
            }
        } while (i > 0 && ok);
        if (i > 0) {
            writer.once('drain', write);
        }
    }
write()
}

writeTenMillionUsers(writeUsers, 'utf-8', () => {
    writeUsers.end();
});