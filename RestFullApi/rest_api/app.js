const express = require("express");
require("./connectionfile");
const Apis = require("./apidb");
const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const app = express();
const port = process.env.PORT || 8000;

app.use(express.json());


const swaggerOptions = {
    swaggerDefinition: {
        info: {
            title: "First Api",
            version: '2.2.1',
            description: "First Api With Swagger Documentaion",
        }
    },
    apis: ["app.js"],
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);
app.use("/api", swaggerUi.serve, swaggerUi.setup(swaggerDocs));



app.get("/apiData", async (req, res) => {

    try {
        const apigetdata = await Apis.find();
        res.send(apigetdata);

    } catch (e) {
        res.send(e);

    }
})

/**
 * @swagger
 * /apiData:
 *  get:
 *    description: Find User Data 
 *    responses:
 *      '201':
 *        description: Success
 */


app.get("/dataById/:id", async (req, res) => {

    try {
        const id = req.params.id;
        const apiiddata = await Apis.findById(id);
        console.log(apiiddata);
        if (!apiiddata) {
            return res.status(404).send();

        }
        else {
            res.status(201).send(apiiddata);
        }

    } catch (e) {
        res.status(500).send(e);

    }
})

/**
 * @swagger
 * /dataById/{id}:
 *  get:
 *     description: Find User Data By Giving ID
 *     parameters:
 *         - in: path
 *           name: id
 *           required: true
 *           description: Numeric ID of the user to get
 *           schema:
 *             type: string
 *     responses:
 *       '201':
 *            description: Success
 */

app.post("/newData", async (req, res) => {
    try {
        const user = new Apis(req.body);
        const seconduser = await user.save();
        res.status(201).send(seconduser);

    } catch (error) {
        res.status(400).send(error);
    }
})

/**
 * @swagger
 * paths:
 *  /newData:
 *    post:
 *      description: Enter Api Data 
 *      consumes:
 *        - application/json:
 *      parameters:
 *        - in: body
 *          name: title
 *          description: Enter title to API
 *          required: true
 *          schema:
 *            $ref: '#/definitions/APIS'
 *      responses:
 *        '201':
 *             description: Created
 * definitions:
 *   APIS:
 *     type: object
 *     required:
 *       - apiName
 *     properties:
 *       apiName:
 *         type: string
 *       apitype:
 *         type: string 
 */


app.delete("/deleteById/:id", async (req, res) => {
    try {
        const apidelete = await Apis.findByIdAndDelete(req.params.id);
        if (!req.params.id) {
            return res.status(400).send();
        }
        else {
            res.status(201).send(apidelete);
        }

    } catch (error) {
        res.status(500).send();

    }
})


/**
 * @swagger
 * /deleteById/{id}:
 *  delete:
 *         description: Delete Data By Providing ID
 *         parameters:
 *             - in: path 
 *               name: id
 *               required: true
 *               schema:
 *                 type: string
 *         responses:
 *           '201':
 *                description: Created
 */

app.patch("/updateByID/:id", async (req, res) => {
    try {
        const _id = req.params.id;
        const updateapi = await Apis.findByIdAndUpdate(_id, req.body, {
            new: true
        });
        res.status(201).send(updateapi);

    } catch (error) {
        res.status(404).send(error);
    }

})
/**
 * @swagger
 * /updateByID/{id}:
 *  patch:
 *       description: Find User Data 
 *       parameters:
 *           - in: path 
 *             name: id
 *             description: ID required
 *             schema:
 *               type: string
 *       responses:
 *         '201':
 *              description: Success
 */
app.listen(port, () => {
    console.log(`connection is setup at ${port}`);
})