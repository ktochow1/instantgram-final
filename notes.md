post-frontend/src/app.js
class App {
  attachEventListeners(){
    document.querySelector('#posts').addEventListener('click', e => {
      console.log('clicked')
    // document.querySelector('.posts').innerHTML = post.renderUpdateForm();
    })
  }
}


post-frontend/src/index.js
document.addEventListener('DOMContentLoaded', () => {
  // alert('LOADED')
  const app = new App();
  app.attachEventListeners();
  const endPoint = 'http://localhost:3000/api/v1/posts';
  fetch(endPoint)
  .then(response => response.json())
  .then(post => post.data.forEach(function(p){
    const newPost = new Post(p);
    // console.log(newPost)
    document.querySelector('#posts').innerHTML += newPost.renderPostList();
  }));
  //function to listen to edit buttons
  //upon clicking button, form displays to change post
  //when form is submitted, patch request make to server to update post in db
});


post-frontend/src/post.js
class Post {

  constructor(data){
    this.id = data.attributes.id;
    this.title = data.attributes.title;
    this.image_url = data.attributes.image_url;
    Post.all.push(this);
  }

  renderPostList(){
    const ul = document.querySelector('#posts')
    console.log(this)
    return `<li><h3>${this.title}<button data-id=${this.id}>edit</button></h3></li>`
  }

  // renderUpdateForm(){
  //   return `<form data-id=${this.id}><label>Title</label><p><input type="text" value="${this.title}" /></p><button type='submit'>Save Post</button></form>`;
  // }

  static findById(id){
    return this.all.find(post => post.id === id)
  }
}
 Post.all = [];

post-frontend/css/index.css


/* CENTER THE EDIT BUTTON */

img {
  border: 5px solid black;
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top: auto;
  margin-bottom: auto;
  width: 30%;
  length: 30%;
}

#post-pics {
  display: block;
  margin-left: auto;
  margin-right: auto;

  /* height: 200px; */
  position: relative;
}

div#div {
  /* border: 5px solid brown; */
  margin: 20px;
  padding: 20px;
  width: 50%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 20px;
  margin-top: auto;

  /* margin: 200px; */
}

 #image-container {
  height: 300px;
  width: 300px;
  position: relative;
  padding: 20px;
  /* margin: 10px; */
  margin-left: auto;
  margin-right: auto;
  margin-bottom: auto;
  margin-top: auto;
  /* border: 3px solid black; */
}

 #edit-button {
  margin: 15px;
  display: run-in ;
  position: sticky;
  top: 50%;
  left: 50%;
  align-items: center;
  /* width: 5%; */
  border: 4px solid black;

}


h3 {
  font-size: 30px;
  text-align: center;
  color: black;
  padding-top: 50px;
}

#title {
  text-align: center;
  font-size: 40px;
  color: brown;
}

#post-form {
  text-align: center;
  color: brown;
}


body {
  background: rgba(247, 227, 161, .2);
  font-family: "Times New Roman", Times, serif;
}


post-frontend/src/db.json
{
  "posts": [
    {"id": 1, "title": "Alfie the Doggo", "created_at": "2020-04-26 21:37:12", "updated_at": "2020-04-28 20:09:51", "image_url": "https://upload.wikimedia.org/wikipedia/commons/6/6..."},
    {"id": 3, "title": "NYC", "created_at": "2020-04-26 21:37:13", "updated_at": "2020-04-28 20:10:42", "image_url": "file:///Users/Katrina/Desktop/Empire_State_Building_Observatory_manhattan_nyc_Julienne_Schaer_055_3f39d2d1-61fd-4d1b-b931-8590bf4c63a7.jpg"},
    {"id": 5, "title": "Paris", "created_at": "2020-04-26 21:41:59", "updated_at": "2020-04-28 20:13:52", "image_url": "https://cdn.shopify.com/s/files/1/0337/7469/produc..."},
    {"id": 7, "title": "Yorkie", "created_at": "2020-04-26 22:09:55", "updated_at": "2020-04-28 20:03:31", "image_url": "https://uptownpuppies.com/wp-content/themes/mega-theme/images/yorkieopennew.jpg"}
  ],
  "comments": [
    {"id": 1, "content": "Alfie is the cutest!!!", "created_at": "2020-04-26 21:41:59", "updated_at": "2020-04-26 21:41:59", "post_id": 4}
  ]
}

post-frontend/src/index.html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <ul id="posts">

    </ul>
    <script src="src/index.js" charset="utf-8"></script>
    <script src="src/post.js" charset="utf-8"></script>
    <script src="src/app.js">

    </script>
  </body>

</html>

 // function getLikes(){
      //   fetch(`http://localhost:3000/api/v1/posts/${postData.id}/like`)
      //   .then(response => response.json())
      //   .then(likes => {
      //     // console.log(likes.data.attributes.counter)
      //     let pContainer = document.querySelector(`[data-id='${postData.id}']`)
      //     let editBtn = document.querySelector(`[data-id='${postData.id}'] .edit-buttons`)
      //     // console.log(editBtn)
      //     // console.log(pContainer)
      //     let likeContainer = document.createElement('h5')
      //     likeContainer.setAttribute('data-id', `${postData.id}`)
      //     likeContainer.innerHTML = `♡ ${likes.data.attributes.counter}`
      //       pContainer.append(likeContainer)
      //       // console.log(pContainer)
      //   })
      // }
      // getLikes();

      // let like = new Like(postData.id)
      // console.log(like)
      // console.log(post.postContainer)
         
          



      //   function zeroLikeHandler(e){
      //     // console.log(e)
      //     let postId = e.explicitOriginalTarget.parentNode.attributes[0].nodeValue
      //     let newLike = new Like(postId)
      //     console.log()
      //     let more = parseInt(e.target.innerText[2]) + 1 
      //     fetch(`http://localhost:3000/api/v1/posts/${postId}/like`, {
      //       method: "POST",
      //       headers: {
      //         "Content-Type": "application/json",
      //         "Accept": "application/json"
      //   },
      //   body: JSON.stringify({
      //     "counter": more
      //   })
      // }).then(res => res.json())
      // .then(like_obj => {
      //   let likeBtn = document.querySelector(`[data-id='${post.id}'] .like-buttons`)
      //   likeBtn.innerHTML = `♥ ${more}`

      // })}



      // let delBtn = post.postContainer.children[5]
      //   delBtn.addEventListener("click", function(e){
      //     deleteFormHandler(e)
      //   })



      // deleteBtn.addEventListener("click", (e) => {
      // deleteFormHandler(e);
    // })
    //   patchForm.addEventListener("submit", (e) => {
    //   editFormHandler(e)

    
    // })
      // editBtn.addEventListener("click", function(e){
      //   postContainer.appendChild(patchForm);
      //   patchForm.appendChild(editTitle);
      //   patchForm.appendChild(editUrl);
      // })


          // this.postContainer.children[4].addEventListener("click", function(e){
          //   const patchForm = document.createElement("FORM");
          //   const editTitle = document.createElement("INPUT");
          //   const editUrl = document.createElement("INPUT");
          //   const editSubmit = document.createElement("INPUT");  
          //   //create label for form
          //  //include placeholder names for fields
          //   patchForm.setAttribute("class", "patch-form");
          //   editTitle.setAttribute("type", "text");
          //   editTitle.setAttribute("class", "editTitle");
          //   editTitle.setAttribute("value", `${attributes.attributes.title}`)
          //   editUrl.setAttribute("class", "editUrl");
          //   editUrl.setAttribute("value", `${attributes.attributes.image_url}`)
          //   editUrl.setAttribute("type", "text");
          //   editSubmit.setAttribute("type", "submit");
          //   this.parentElement.append(patchForm)
          //   patchForm.appendChild(editTitle)
          //   patchForm.appendChild(editUrl)
          //   patchForm.appendChild(editSubmit)

          //   editSubmit.addEventListener("click", function(e){
          //     e.preventDefault()
          //     let title = editTitle.value
          //     let url = editUrl.value
          //     patchFetch(title, url)
          //     })
          //   })
                // let postSubmit = document.querySelector("#submit-button")
      // console.log(postSubmit)
      // postSubmit.addEventListener("click", (e) => {
      //   // e.preventDefault()
      //   // console.log(e)
      //   createFormHandler(e);
      // })
        // function patchFetch(title, image_url){
      //   const bodyData = {title, image_url}
      //   fetch(`http://localhost:3000/api/v1/posts/${attributes.id}`, {
      //     headers: {
      //       "Content-type": "application/json",
      //       "Accept": "application/json"
      //     },
      //     method: 'PATCH',
      //     body: JSON.stringify(bodyData),
      //     }).then(response => response.json())
      //     .then(data =>  {
      //     //make the page reload after submitting patch
      //       let currentContainer =  document.querySelector(`[data-id='${data.data.id}']`)
      //       currentContainer.firstChild.innerHTML = data.data.attributes.title
      //       currentContainer.childNodes[3].attributes[1].value = data.data.attributes.image_url
      //     })
      // }

            

            // function editFormHandler(e){
            //     // e.preventDefault();
            //     const title = document.querySelector("#editTitle").value;
            //     const image_url = document.querySelector("#editUrl").value;
            //     editTitle.id = e.originalTarget.dataset
            //     patchFetch(title, image_url);
            //   }
          //   patchForm.addEventListener("submit", (e) => {
          //   editFormHandler(e)
          //
          //   //reset the input boxes after submit
          //
          // })

    //       // let current_post = document.querySelector(`[data-id='${bodyData.data.id}']`)
    //   const current_p = document.querySelector(`[data-id='${this.attributes.id}']`)//.bind(this)//.appendChild(patchForm)
    //   console.log(current_p) //null
    //   // console.log(this) //correct, clicked edit button
    //   // const commentSub = document.getElementById('comment-submit')
    //   // console.log(commentSub)



    //

  // const form = document.getElementById('post-form')
  // h3.setAttribute("id", "post-title")
  // img.setAttribute("id", "imgUrl")
  // img.setAttribute("height", "350");
  // img.setAttribute("width", "250");
  // img.setAttribute("src", `${p.image_url}`)
  // let h3Text = document.createTextNode(`${p.title}`)
  //
  //
  // deleteBtn.setAttribute("id", "deleteBtn")
  // deleteBtn.setAttribute("class", "buttons")
  // editBtn.setAttribute("class", "buttons");
  // likeBtn.setAttribute("class", "like-buttons");
  // likeBtn.setAttribute("id", "like-button")
  // likeBtn.setAttribute("data-id", `${post.id}`)

  // patchForm.setAttribute("id", "patch-form");
  // editTitle.setAttribute("type", "text");
  // editTitle.setAttribute("id", "editTitle")
  // editUrl.setAttribute("id", "editUrl")
  // editUrl.setAttribute("type", "text");
  // editSubmit.setAttribute("type", "submit");

  // commentForm.setAttribute("data-id", `${post.id}`)
  // comments.setAttribute("id", "comments");
  // commentForm.setAttribute("id", "comment-form");
  // comTxtArea.setAttribute("type", "textarea");
  // comTxtArea.setAttribute("placeholder", "write your comment here")
  // comSub.setAttribute("type", "submit")
  // comSub.setAttribute("value", "Submit")
  // // create Edit btn
  // editBtn.setAttribute("id", `${post.id}`);
  // patchForm.setAttribute("data-id", `${post.id}`);
  // editTitle.setAttribute("placeholder", `${p.title}`)
  // editTitle.setAttribute("data-id", `${post.id}`)
  // editUrl.setAttribute("placeholder", `${p.image_url}`);
  // editUrl.setAttribute("data-id", `${post.id}`)
  // editSubmit.setAttribute("data-id", `${post.id}`);
  //
  // deleteBtn.setAttribute("data-id", `${post.id}`)
  // //append created elements
  // divContainer.appendChild(postContainer)
  // postContainer.appendChild(h3)
  // h3.appendChild(h3Text)
  // postContainer.appendChild(img)
  // postContainer.appendChild(editBtn)
  // editBtn.appendChild(btnTxt)
  // postContainer.appendChild(likeBtn)
  // likeBtn.appendChild(likeTxt)
  // postContainer.appendChild(deleteBtn);
  // deleteBtn.appendChild(deleteTxt);
  // postContainer.appendChild(comments);
  // comments.appendChild(commentForm);
  // commentForm.appendChild(comTxtArea);
  // commentForm.appendChild(comSub);


  // patchForm.appendChild(editSubmit);






    // document.getElementById('div-container').appendChild(this.postContainer)



    // <div id="post-container" data-id="2"></div>
    // let h3 = document.createElement("h3");
    // let img = document.createElement("img");
    // let comments = document.createElement("div");
    // let commentForm = document.createElement("FORM");
    // let comTxtArea = document.createElement("INPUT");
    // let comSub = document.createElement("INPUT");
    // let deleteBtn = document.createElement("button");
    // let deleteTxt = document.createTextNode("Delete");
    // let editBtn = document.createElement("button");
    // let btnTxt = document.createTextNode("Edit");
    // let likeBtn = document.createElement("button");
    // let likeTxt = document.createTextNode(`♡ ${0}`);
    // this.name = name
    // this.image_url = image_url
  



      // {let number
      // if(posts.data.relationships.like.data){
      //   number = post.relationships.likes.data.length
      // } else {
      //   number = 0
      // }
      // console.log(post.relationships.likes)
      // console.log(post.relationships.likes.data[0].id)
      // create DivContainer}

      // create post post-form
      // let commentForm = document.createElement("FORM");
      ///////////////////////////////////////////////////////////////////////////

      // function getLikes(){
      //   fetch(`http://localhost:3000/api/v1/posts`)
      //   .then(resp => resp.json())
      //   .then(likes => {
      //     likes.data.forEach(like => {
      //       let divContainer = document.querySelector("#div-container");
      //       let postContainer = document.createElement("div");
      //       postContainer.setAttribute("id", "post-container");
      //
      //     })
      //   })
      // }
      ///////////////////////////////////////////////////////////////////////////
  // likeBtn.addEventListener("click", function(e){
  //         createLikeHandler(e);
  //       })
  // function createLikeHandler(e){
  //   e.preventDefault();
  //   let more = parseInt(e.target.previousElementSibling.innerText) + 1
  //     console.log(e)
  // }



  //
  // function getLikes(){
  //   fetch(`http://localhost:3000/api/v1/posts/${post.id}/likes`)
  //   .then(resp => resp.json())
  //   .then(likes => {
  //     // console.log(likes)
  //   //   // console.log(post)
  //   //   // likes.forEach(like => {
  //   //     // console.log(like.attributes.likes)
  //   //     // postContainer.children[3].innerHTML[2] = post.relationships.likes.data
  //   //
  //   //     // console.log(post.relationships.likes.data)
  //   //     // console.log(postContainer.children[3].innerHTML[2] = like.attributes.likes)
  //   //     let likeo = document.querySelector("#like-button")
  //   //     let page = document.querySelector("#div-container")
  //   //     var i;
  //   //     for(i = 0; i < page.children.length; i++){
  //
  //   //     }
  //
  //    })
  //
  // }
  // getLikes()
  // patchForm.appendChild(editSubmit);

// document.addEventListener("DOMContentLoaded", () => {
//   getPosts();

  // let editBtn = document.querySelector("#edit-button");
  // editBtn.addEventListener("click", event => {
  //   console.log('click');
  // })

// })

// function getPosts(){
//   fetch(endpoint)
//   .then(response => response.json())
//   .then(posts => {
//     posts.data.forEach(post => {
//       const markup = `<div data-id=${post.id}>
//         <h3>${post.attributes.title}</h3><br>
//         <img src=${post.attributes.image_url} height="200" width="250"><br>
//         <button id="edit-button" data-id=${post.id}>Edit</button><br>
//         </div>`;
//         document.querySelector('#post-container').innerHTML += markup
//     });
//   });
// };

// function createFormHandler(e){
//   e.preventDefault();
//   const formTitle = document.querySelector("#input-title").value;
//   const formUrl = document.querySelector("#input-url").value;
//   postFetch(formTitle, formUrl);
//   // const submit = document.querySelector("#submit-button");
// }

// function postFetch(title, image_url){
//   const bodyData = {title, image_url}
//   fetch(endpoint, {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json", //explicit about content type
//       "Accept": "application/json"
//   },
//     body: JSON.stringify(bodyData)
//   })
//   .then(response => response.json())
//   .then(post => {
    
//     const postData = post.data.attributes
//     console.log(postData)
//     const postMarkup = `
//     <div data-id=${post.id}>
//     <h3>${postData.title}</h3>
//     <img src=${postData.image_url} height="200" width="250">
//     <button data-id=${postData.id}>Edit</button>
//     </div>
//     `;
//     document.querySelector("#post-container").innerHTML += postMarkup;

        // let currentContainer = document.querySelector(`[data-id='${postData.id}'], .post-container`)
        // currentContainer.append(comments)
        // console.log(currentContainer)
        
        
        // console.log(currentContainer)
        // console.log(currentContainer)

      
      // let comments = new Comment(postData.attributes.comments)
      // console.log(comments)
      // let commentsDiv = document.querySelector(".comments-div")
      // console.log(commentsDiv)
      // let comment = new Comment()
      
      // let fcontainer = document.querySelector("#post-container")
      // console.log(fcontainer)
      // console.log(post.postContainer.children[3])
      // let postDiv = document.createElement("div")
      // postDiv.innerHTML = post.postContainer.innerHTML
      // fcontainer.appendChild(post)


      // let postId = postData.id
      // let currentContainer = document.querySelector(`.post-container`)
      // console.log(currentContainer)

      // console.log(comments)
    // console.log(postData.attributes.comments)
      // postData.relationships.comments.data.forEach(e => {console.log(e)})
      // let sortButton = document.createElement("button")
      // let sortButtonText = document.createTextNode("Sort")
      // sortButton.appendChild(sortButtonText)
      // let div = document.querySelector("#div-container");
      // div.appendChild(sortButton)

      
        // let allPosts = posts.data
        
        // console.log(allPosts)
        // const entries = Object.entries(allPosts)
        // allPosts.forEach(post => {
        //   console.log(post)
        //   // const values = Object.values(post)
        //   // const titles = values[2]
          
        //   // console.log(values[2])
          
        // })


      
      // console.log(div)
      // let divChildren = div.children
      // divChildren = document.querySelectorAll('.post-container')
      // Array.from(divChildren).forEach((e) => {
      //   return e.firstElementChild.innerText
      // })
      // jsonPostTitle = document.getElementsByClassName('post-container')
      // console.log(jsonPostTitle)

      // Array.from(jsonPostTitle).forEach(e => {
      //   let title = e.firstElementChild
      //   return title
      // })
      
      
      // newArr = jsonPostTitle.map((el) => {
      //   console.log(el)
      // })
      // console.log(newArr)
      // let domPost = document.querySelectorAll('post-container')
      // let domPostTitle = post.postContainer.firstElementChild
      // json.data = document.body.getElementsByClassName("post-container")
      // console.log()
      // json.data = post.postContainer
      // jsonPostTitle.forEach((e) => {
      //   e = document.querySelectorAll('.post-container')
      //   // console.log(e)

      // })


      // let newArr = jsonPostTitle.map((el) => {
      //   // el = document.querySelector('.post-container')
      //   return el
      // })
      // newArr.sort()
      // console.log(newArr)
      // })
      // console.log(newArr)
        // console.log(domPost)
      // Array.from(jsonPostTitle).forEach((el) => {
      //   // console.log(el)
      //   el = document.getElementsByClassName('post-container')
      //   Array.from(el).forEach((el) => {
      //     console.log(el)
      //   })
      //   // console.log(el)
      //   // .firstElementChild.innerHTML
      // })
      
      
      // console.log(json.data.getElementByTagName('h3'))
      // let posts = json.data.document.body
      // posts.document.body.getElementByTagName('h3')
      // console.log(json.data)
      // newArr.push(post.postContainer)
      // // post.postContainer
      // console.log(newArr)
      // json.data = document.body.getElementsByClassName("post-container")
        // console.log(json.data)
        // let newArr = json.data.map((el) => {
          // console.log(el)
        

        // console.log(newArr)
        
        // {
          // let jsonData = json.data.sort((a, b) => {
          //   return a.attributes.title > b.attributes.title
          //   // console.log(a.attributes.title)
          // })
          // console.log(json)
        // let newArr = json.data.map((el) => {
          // let titles = el.attributes.title
          
          // let posts = document.getElementsByClassName('post-container')
        //   let title = el.attributes.title
        //   let post = document.getElementsByClassName('post-title')
        //   console.log(title)
        //   return post
          // console.log(post)

          // console.log(el.attributes.title)
          // console.log(post)
          // post.title = document.querySelector('.')
          // post.title = document.querySelector('.post-container .post-title')
          // console.log(post)
          // return posts
          // console.log(posts)
          // console.log(el)
          // return titles
        // })
        // console.log(newArr)

        // newArr.forEach(e => {
        //   let divContainer = document.body.children[2].children
        //   // .querySelector('')    
        //   // console.log(divContainer)
          
        // })

        // newArr.sort((a, b) => {
        //   // let nameA = document.querySelector(a)
        //   console.log(a)
        // })
        // 
          // var nameA = a
          // var nameB = b.attributes.title.toUpperCase()
          // console.log(nameA)
          // if(nameA < nameB){
          //   return -1
          // }
          // if(nameA > nameB){
          //   return 1
          // }
          // return 0
        // })

          
         
        
        // let jsonArr = json.data
        // const entries = Object.entries(jsonArr)
        // let attributes = entries[1][1]
        // let jackpot = Object.entries(attributes.attributes)
        // jackpot[0][1].push(postTitlesArray)
        // console.log(postTitlesArray)
        // console.log(Object.entries(attributes))
        // let titles = Object.entries(attributes)
        // console.log(titles)
        // console.log(entries[1][1])
        // const newArr = entries[1]
        // let attributes = Object.entries(newArr)
        // console.log(attributes)
        // console.log(entries)
        // console.log(jsonArr)
        // entries.map(x => {
        //   console.log(x)
        // })
        // console.log(postTitlesArray)
        // json.data.forEach(post => {
          // postTitlesArray.push(post.attributes.title)
          // postTitlesArray.map(post => {
          //   console.log(post)
          // })
          // console.log(postTitlesArray)
          //   .attributes.title)
          // console.log(postTitlesArray)
        // })
        // return postTitlesArray
      // })

    

      // postData.attributes.comments.forEach(c => {console.log(c)})

            // mainDiv.append(sortedContainer)
      
      // mainDiv.append(alphabeticalPosts)
      // .forEach((e) => {
      //   e.remove()
      // })
      
      // mainDiv.append(alphabeticalPosts)
      // let divPosts = div.childNodes 
      // let allPosts = []
      //  for(var i in divPosts){
      //    if(divPosts[i] == 1){
      //      allPosts.push(divPosts[i])
      //    }
      //  }


       
    //   const allDivs = document.querySelectorAll(".post-container")
    //   let titleArr = []
    //   for(var i = 0; i < allDivs.length; i++){
    //     allDivs.forEach(e => {
    //       let collection = e.children 
    //       titleArr.push(collection[0].innerHTML)
    //       console.log(titleArr)
    //   })
    // }
      // Array.from.divContainer.forEach((el) => {
      //   console.log(el)
      // })/
    //  console.log(div)
       
     
      
      // let newDiv = document.createElement('div')
      
      
      // docBody.appendChild(newDiv)

          //   fetch(endpoint)
    //   .then(resp => resp.json())
    //   .then(json => {
    //   // let jsonArr = json.data
    //   // for(const post of jsonArr){
    //   //   let newArr = jsonArr.map((e) => {
    //   //     return e.attributes.title
    //   //   })
    //   //   // jsonArr.forEach((el) => {
    //   //   //   // console.log(el)
    //   //   // })
    //   // }
    //     // let bigDiv = document.querySelector('div#div-container')
        
        
    //     // bigDiv.remove(components)
        
        
    //     let newArr = json.data.map((e) => {
    //       // console.log(e)
    //       e = document.querySelectorAll('div.post-container')
    //       // console.log(e)
    //     })
    //     let sortedArr = newArr.sort()
    //     // console.log(newArr)
    //     sortedArr.forEach(el => {
    //       // console.log(el)
    //     })
    // })
    