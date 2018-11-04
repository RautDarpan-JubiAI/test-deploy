const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const jsonParser = bodyParser.json()
const urlencodedParser = bodyParser.urlencoded({ extended: false })
const PORT=process.env.PORT||8002
app.use(jsonParser)
app.use(urlencodedParser)

app.listen(PORT, ()=>{
console.log('Server is listening at ')
})
app.get('/', (req, res) => {
  res.send('Chat Bot ' + PORT)
})
