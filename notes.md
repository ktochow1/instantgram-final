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
