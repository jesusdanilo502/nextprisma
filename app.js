

const {PrismaClient} = require("@prisma/client");
const { Main } = require("next/document");

const prima = new PrismaClient()

async function main(){
    //crear algo
/*
    const post = await prima.post.createMany({
        data:[
            {title:'titulo1', content: 'mi post'},
            {title:'titulo2', content: 'mi post'},
            {title:'titulo3', content: 'mi post'}
        ]
    })
    console.log(post)
    */

    const allPost = await prima.post.findMany()
    console.log(allPost);
}



main()

  .catch((e)=>{
      throw e
  })
  .finally(async()=>{
      await prima.$disconnect()
  })