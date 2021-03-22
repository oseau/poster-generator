<script setup lang="ts">
import { ref } from "vue";
import domtoimage from "dom-to-image";
import { saveAs } from "file-saver";

const top = ref("OK教育 小学英语 随堂晨读");
const content = ref(`《4 年级下册》
Page 2
Unit 1`);
const note = ref("");
const detail = ref("");
const footer = ref(`985/211 海归硕士带你每天练英文
联系老师进打卡群
184 3800 3188`);
const pager = ref("《4 年级下册》 Page 2, Unit 1");

const generate = () => {
  domtoimage.toBlob(document.getElementById("my-node")).then(function (blob) {
    saveAs(blob, "ok-morning.png");
  });
};
</script>

<template>
  <div class="flex h-screen">
    <div class="flex-auto h-screen w-1/2">
      <div class="antialiased text-gray-900 px-6">
        <div class="max-w-md">
          <div class="grid grid-cols-1 gap-6">
            <label class="block">
              <span class="text-gray-700">top</span>
              <input
                type="text"
                class="mt-1 block w-full"
                placeholder="OK教育 小学英语 随堂晨读"
                v-model="top"
              />
            </label>
            <label class="block">
              <span class="text-gray-700">content</span>
              <textarea
                class="mt-1 block w-full"
                rows="3"
                placeholder="内容"
                v-model="content"
              ></textarea>
            </label>
            <label class="block">
              <span class="text-gray-700">note</span>
              <input type="text" class="mt-1 block w-full" v-model="note" />
            </label>
            <label class="block">
              <span class="text-gray-700">detail</span>
              <textarea
                class="mt-1 block w-full"
                rows="3"
                v-model="detail"
              ></textarea>
            </label>
            <label class="block">
              <span class="text-gray-700">footer</span>
              <textarea
                class="mt-1 block w-full"
                rows="3"
                v-model="footer"
              ></textarea>
            </label>
            <label class="block">
              <span class="text-gray-700">pager</span>
              <input type="text" class="mt-1 block w-full" v-model="pager" />
            </label>
          </div>
        </div>
        <button
          type="button"
          class="mt-10 py-2 px-4 bg-emerald-500 text-white font-semibold rounded-lg shadow-md focus:outline-none"
          @click="generate"
        >
          Button
        </button>
      </div>
    </div>
    <div
      class="flex-auto w-1/2"
      style="transform-origin: 0 0; transform: scale(0.65); zoom: 0.65"
    >
      <div id="my-node" class="h-screen relative text-center">
        <div class="chinese pt-52 text-5xl">{{ top }}</div>
        <div id="b" class="pt-36 text-9xl font-black leading-snug">
          {{ content }}
        </div>
        <div class="pt-36 text-6xl font-bold">{{ note }}</div>
        <div class="chinese pt-20 text-6xl font-medium" style="color: black">
          {{ detail }}
        </div>
        <div id="c" class="absolute bottom-0 left-0 right-0 pt-20">
          <div
            v-for="l in footer.split('\n')"
            class="chinese text-3xl font-semibold my-5"
          >
            {{ l }}
          </div>
          <div class="chinese text-2xl font-medium mt-10 mb-28">
            {{ pager }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<route lang="yaml">
meta:
  layout: home
</route>
