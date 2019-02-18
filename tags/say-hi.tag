<say-hi>
  <img src="images/{ petImage }.jpg" style="background-image:url(images/{ backgroundImg });" ref="pet">
  <div>
		<div class="bar health">
			<div style="width:{ percentHealth }%;">&nbsp;</div>
		</div>
		<p>HEALTH: { petHealth }</p>
	</div>

  <p>{ message }</p>
  <div show={this.petHealth>=0}>
  <button onClick={ sayHello }>Say hello!</button>
  <button onClick={ touchDog }>Touch Dog</button>
</div>

  <div show={this.petHealth>=0}>
      Food
      <select onchange={updateFoodState}>
          <option value="">---</option>
          <option value="canEat">Meet</option>
          <option value="limit">Cheese</option>
          <option value="limit">Milk</option>
          <option value="cannotEat">Chocolate</option>
          <option value="canEat">Fruit</option>
          <option value="cannotEat">Onion</option>
      </select>
  </div>

 <script>
 this.message = ''
 this.petImage = "pet-0";
 this.backgroundImg = "";
 this.foodState="";
 this.petHealth=50;
 this.percentHealth = this.petHealth;

 sayHello() {
  this.message = 'You: Hello'
  this.petImage = "pet-1"
}
touchDog() {
  this.message = 'You: Why are you so cute?'
  this.petImage = "pet-2"
}


updateDogState(){
    if (this.foodState=="canEat"){
    this.petHealth=this.petHealth + 10;
} else if (this.foodState=="limit"){
    this.petHealth=this.petHealth + 5;
} else{
    this.petHealth=this.petHealth - 15;
}
}

updateDogImage(){
    if (this.petHealth<=10){
        this.petImage="die";
    } else if (this.petHealth<=30&this.petHealth>0){
   this.petImage="sad";
} else if (this.petHealth>=80){
   this.petImage="superHappy";
} else{
        this.petImage="happy";
}
}

setStartBars() {
        if (this.petHealth < 0) {
            this.percentHealth = 0;
        } else if (this.petHealth > 100) {
            this.percentHealth = 100;
        } else {
            this.percentHealth = this.petHealth;
        }
}



updateFoodState(event){
    this.foodState= event.target.value;
    console.log(event);
    this.updateDogState()
  this.setStartBars();
  this.updateDogImage();
  this.foodState="";
}

 </script>

 <style>
 button {
         font-size: 1em;
         padding-right: 0.4em;
         margin-bottom: 1em;
         border-radius: 0.25em;
         background-color: coral;
         border: 1px solid navy;
         cursor: pointer;
     }
 .bar {
        width: 100%;
        border: 1px solid grey;
        text-align: left;
    }
    .bar > div {
        transition: width 1s;
    }
    .bar.health > div {
        background-color: dodgerblue;
    }
  img{
    width:500px;
    height:450px;

  }
 </style>
</say-hi>
