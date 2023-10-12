// Discord Js
const { Client, Collection, GatewayIntentBits } = require('discord.js');
const client = new Client({ 
  partials: ["CHANNEL"], 
  intents: 
  [ 
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.GuildMembers,
  ],
});

// Discord JS
client.discord = require('discord.js');
// Express
client.express = require('express');
const { urlencoded } = require('express');
const res = require('express/lib/response');
client.app = client.express();
// Config
client.config = require('./config.json');

client.login(client.config.token);

client.on("ready", () =>{
  console.log(`Startato ${client.user.tag}`);
})

client.app.use(
    client.express.urlencoded({
        extended: true
    })
);
client.app.use(client.express.json());

client.app.post('/log', function (req, res) { 
  console.log(req.body.embed.id_stanza); 
  client.guilds.cache.get(client.config.guild_id).channels.cache.get(req.body.embed.id_stanza).send({ embeds: [
      new client.discord.EmbedBuilder()
          .setTitle(req.body.embed.title)
          .setColor(Number(req.body.embed.color))
          .setDescription(req.body.embed.description)
          .setTimestamp()
          .setFooter({ text: 'Developed by Enrii' })
  ] });
});

client.app.post('/checkRole', async function (req, res) { 
  const user = await client.guilds.cache.get(client.config.guild_id).members.fetch(req.body.array.id);
  if (user && user.roles && user.roles.cache.has(client.config.own)) {
    res.end("big");
  } else if (user && user.roles && user.roles.cache.has(client.config.dev)) {
    res.end("big");
  } else if (user && user.roles && user.roles.cache.has(client.config.admin)) {
    res.end("admin");
  } else if (user && user.roles && user.roles.cache.has(client.config.mod)) {
    res.end("mod");
  } else if (user && user.roles && user.roles.cache.has(client.config.helper)) {
    res.end("helper");
  }
});


const PORT = 4568;
client.app.listen(PORT, () => {
  console.log(`Server in ascolto sulla porta ${PORT}`);
});