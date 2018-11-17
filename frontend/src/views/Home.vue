<template>
  <div class="home">
    <NavBar/>
    <div class="title md-headline">Your items</div>
    <div class="md-layout content">
      <ItemCard v-for="item in items" :item="item" :key="item.id" @deleted="onItemDeleted" class="md-layout-item item-card"/>
    </div>
    <md-button aria-label="New" class="md-fab md-primary md-fab-bottom-right md-fixed" to="/new-item">
        <md-icon>add</md-icon>
    </md-button>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";
import ItemCard from "@/components/ItemCard";
import { authData } from "@/models/auth";
import itemRepository from "@/models/item_repository";

export default {
  name: "home",
  components: {
    NavBar,
    ItemCard
  },
  data: function() {
    return {
      items: []
    };
  },
  methods: {
    onItemDeleted(item) {
      this.items.splice(this.items.indexOf(item), 1);
    }
  },
  created: function() {
    const ssn = authData().ssn;
    if (!ssn) {
      return;
    }
    itemRepository
      .getBySeller(ssn)
      .then(res => {
        this.items = res.data;
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
.title {
  text-align: center;
  margin-top: 30px;
}

.content {
  align-items: center;
  justify-content: center;
}

.item-card {
  margin: 10px;
}

.home {
  margin-bottom: 100px;
}
</style>
