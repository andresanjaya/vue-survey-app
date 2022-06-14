<template>
  <li>
    <p>
      <span class="highlight">{{ name }}</span> ({{ age }}  y.o) favorite hobbies is
      <span :class="hobbiesClass">{{ hobbies }}</span>.
    </p>
  </li>
</template>

<script>
export default {
  props: ['name', 'age', 'hobbies'],
  computed: {
    hobbiesClass() {
      return 'highlight hobbies--' + this.hobbies;
    },
  },
};
</script>

<style scoped>
li {
  margin: 1rem 0;
  border: 1px solid #ccc;
  padding: 1rem;
}

h3,
p {
  font-size: 1rem;
  margin: 0.5rem 0;
}

.highlight {
  font-weight: bold;
}

.hobbies--Movies {
  color: #00ADB5;
}

.hobbies--Sport {
  color: #FFCE41;
}

.hobbies--Art {
  color: #E84545;
}

.hobbies--Music {
  color: #1FAB89;
}

.hobbies--VideoGames {
  color: #424874;
}

.hobbies--Cooking {
  color: #F07B3F;
}

.hobbies--OutsideActivities {
  color: #F07B3F;
}

.hobbies--Cooking {
  color: #F07B3F;
}



.hobbies--OutsideActivities {
  color: #17B978;
}

.hobbies--OutsideActivities {
  color: #17B978;
}

</style>