<template>
  <section>
    <base-card>
      <h2>What are YOUR Hobbies?</h2>
      <form @submit.prevent="submitSurvey">
        <div class="form-control">
          <label for="name">Your Name</label>
          <input type="text" id="name" name="name" v-model.trim="enteredName" required />
        </div>
        <div class="form-control">
          <label for="name">Your Age</label>
          <br>
          <input type="number" id="age" name="age" v-model.trim="enteredAge" required />
        </div>
        
        <h3>What is your favorite hobbies to do when you have free time?</h3>
        <div class="form-control">
          <input type="radio" id="r-movies" value="Movies" name="hobbies" v-model="chosenHobbies" />
          <label for="r-movies">Movies</label>
        </div>
        <div class="form-control">
          <input
            type="radio"
            id="rating-sport"
            value="Sport"
            name="hobbies"
            v-model="chosenHobbies"
          />
          <label for="rating-sport">Sport</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-art" value="Art" name="hobbies" v-model="chosenHobbies" />
          <label for="r-art">Art</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-music" value="Music" name="hobbies" v-model="chosenHobbies" />
          <label for="r-music">Music</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-video-games" value="VideoGames" name="hobbies" v-model="chosenHobbies" />
          <label for="r-video-games">Video Games</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-cooking" value="Cooking" name="hobbies" v-model="chosenHobbies" />
          <label for="r-cooking">Cooking</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-outside" value="OutsideActivities" name="hobbies" v-model="chosenHobbies" />
          <label for="r-outside">Outside Recreational Activities (Canoeing, Hiking, etc.)</label>
        </div>
        <div class="form-control">
          <input type="radio" id="r-other" value="Other" name="hobbies" v-model="chosenHobbies" />
          <label for="r-other">Other</label>
        </div>
        <p
          v-if="invalidInput"
        >One or more input fields are invalid. Please check your provided data.</p>
        <p v-if="error">{{ error }}</p>
        <div>
          <base-button>Submit</base-button>
        </div>
      </form>
    </base-card>
  </section>
</template>

<script>
export default {
  data() {
    return {
      enteredName: '',
      enteredAge: '',
      chosenHobbies: null,
      invalidInput: false,
      error: null,
    };
  },
  // emits: ['survey-submit'],
  methods: {
    submitSurvey() {
      if (this.enteredName === '' || !this.chosenHobbies) {
        this.invalidInput = true;
        return;
      }
      this.invalidInput = false;

      // this.$emit('survey-submit', {
      //   userName: this.enteredName,
      //   rating: this.chosenHobbies,
      // });

      this.error = null;
      fetch('https://udemy-learn-vue-53f4a-default-rtdb.asia-southeast1.firebasedatabase.app/surveys.json', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: this.enteredName,
          age: this.enteredAge,
          hobbies: this.chosenHobbies,
        }),
      })
        .then((response) => {
          if (response.ok) {
            // ...
          } else {
            throw new Error('Could not save data!');
          }
        })
        .catch((error) => {
          console.log(error);
          this.error = error.message;
        });

      this.enteredName = '';
      this.chosenHobbies = null;
    },
  },
};
</script>

<style scoped>
.form-control {
  margin: 0.5rem 0;
}

input[type='text'] {
  display: block;
  width: 20rem;
  margin-top: 0.5rem;
}
</style>