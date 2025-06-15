import mysql from 'mysql';

const connection = mysql.createConnection({
    host: '<your cloud sql instance public ip>',
    user: 'hapi-server',
    password: '<your password>',
    database: 'buy-and-sell',
});

export const db = {
    connect: () => connection.connect(),
    query: (queryString, escapedValues) =>
        new Promise((resolve, reject) => {
            connection.query(queryString, escapedValues, (error, results, fields) => {
                if (error) reject(error);
                resolve({ results, fields });
            })
        }),
    end: () => connection.end(),
}