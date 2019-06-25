const herro = () => {
	console.log("herrooo world");
}

herro()

arr = [1,2,3,4,5]

const timesTwo = (arr) => {
	console.log(arr.map(x=>x*2))
}

timesTwo(arr)

const revArr = (arr) => {
	let rev = []
	for(let i = arr.length-1; i >= 0; i--){
		rev.push(arr[i])
	}
	console.log(rev)
}

revArr(arr)

const revReduce = (arr) => {
	let rev = arr.reduce((acc,curr)=>{
		acc.unshift(curr)
		return acc
	},[])
}

revReduce(arr)


//
//document.getElementById("blobs")
//debugger !!! Replacement for console.log
//debugger is the new binding.pry
//querySelector("body #idName tag") the thing to the left is the parent of the thing to the right. Returns the first match
//querySelectorAll(".js-blobs #idName tag") returns all elements that match the answer
//class="blobs js-blobs"
//arrayItem.remove()
//listTag.innerText = ""
//innerText or innerHTML
//Array.isArray(pass in item)
//promises
//
//Janes Roadmap 
//	fundamentals manipulating elements or datastructures
//	dom manipulation
//	static data
//	fetch
//	
console.log(dog)

let weatherToday = "Rainy";
console.log(weatherToday)
let weatherToday = "Sunny"

var dog = "clifford"
console.log(dog) 
function exerciseDog(dogName, dogBreed) {
  if (weatherToday === "Rainy") {
    return `${dogName} did not exercise due to rain`;
  }
  console.log(`Wake ${dogName} the ${dogBreed}`);
  console.log(`Leash ${dogName} the ${dogBreed}`);
  console.log(`Walk to the park ${dogName} the ${dogBreed}`);
  console.log(`Throw the fribsee for ${dogName} the ${dogBreed}`);
  console.log(`Walk home with ${dogName} the ${dogBreed}`);
  console.log(`Unleash ${dogName} the ${dogBreed}`);
  return `${dogName} is happy and tired!`
}
 
let result = exerciseDog("Byron", "poodle");
console.log(result); // => "Byron did not exercise due to rain"

// 
// 
const arrayReader = (array) => {
	array.forEach((x)=>console.log(x))
}

arrayReader(arr)

console.log("hello")

//alert("hello user")
//document.getElementById("hello-buton")
//document.querySelector("#hello-button")
//event objects are bomb
//
//

