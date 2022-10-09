---
layout: post
title: "Text to Image Art: Experiments and Prompt Guide for DALL-E Mini and Other AI Art Models"
description: "I discuss how to write better prompts for DALL-E mini, and bigger models."
date: 2022-07-11
importance: 7
sitemap: true
---

Ever since [DALL-E](https://openai.com/blog/dall-e/) came out in January 2021, or even before that with [PixelRNN](https://arxiv.org/pdf/1601.06759.pdf), I've found generative models, especially for images, amazing. But what I was interested in was how could I write better prompts that yielded the most beautiful images?

The idea of text-to-image generators like [CLIP](/wiki/clip) or [GLIDE](/wiki/glide) is even more astounding, and I love being able to play with them and trying to get a glimpse of the way they "perceive" textual and image inputs. I think interpretability is a fascinating field of study, and understanding a model's representations may yield ideas for better models in the future (though usually the simplest way to make a better model is training a bigger one with more compute).

Giving a model a prompt to generate an image out-of becomes sort of addictive, and I've spent longer than I am proud to admit fiddling around with these. Here are some of the images I made with [EleutherAI's](https://www.eleuther.ai/) `.imagine` model (which I think is a VQVAE like DALL-E) and some I made using everyone's favorite viral text-to-image generator, [DALL-E Mini](https://huggingface.co/spaces/dalle-mini/dalle-mini) (a small open source version of DALL-E 2, a guided diffusion model with extra steps).

What follow are a small guide on prompt engineering for dall-e mini and other text-to-image models. Then a showcase of the prompts I used for generating images, and the images I obtained. These were cherrypicked, as they were the ones I liked the most.

The first batch is all made with EleutherAI's imagine model, and the second one was made with DALL-E Mini, which can be told from the screenshot's visible UI.

I found the comparisons where I used the same prompt in both models to be particularly interesting in showcasing how much better DALL-E mini is at composition, even though VQVAE, being bigger and taking longer, generates images at a higher resolution and thus renders textures and objects in a more believable way.

I also hope seeing these prompts can give you a small hint of how to make better prompts for your own ideas (usually, just appending 'digital painting' or 'oil painting' and 'artstation' in the end will do half of the trick).

My general idea is that DALL-E mini can generate satisfying results when the prompt is well-constructed enough, if asked to generate images of inanimate objects, landscapes, buildings and so on. However, illustrations containing animals, people, humanoids or anything that moves, or prompts that ask for a specific action or use verbs, usually get poor results. Bigger models usually deal better with humanoid or animal shapes, and construct scenes better when they include action.

Feel free to steal any of these images and use them for anything, or share them on social media. I mostly tried prompts that dealt with Biblical or mythological themes, because for some reason I found most people didn't do those sorts of prompts as much (or maybe because I'm a big fantasy/D&D geek).

_**Update**: Besides Craiyon, I've found [Dall-E Flow](https://github.com/jina-ai/dalle-flow), a colab notebook that uses [Jina-AI](https://github.com/jina-ai/jina) to be the best tool for generating beautiful DALL-E images, and I recommend everyone to give it a spin. It's free and open source, and I'm loving it._

I also wrote separate articles after experimenting with [OpenAI's DALL-E 2](/DALL-E-2-prompt-guide) and its [open source competition, StableDiffusion](/stable-diffusion-vs-dalle-2) both of which blew my mind and made me think of the future differently.

### How to write prompts for DALL-E / StableDiffusion
Usually, what I do is write what I want (adjectives + nouns usually get better results than verbs or complex scenes), then append 
- "Gorgeous/amazing/beautiful" + "digital painting/oil painting/digital art/canvas/3d render" + any of "unreal engine/unity engine"
- Then I append "style clues" like "anime/Picasso/Giger -always good results-/Junji Ito"

Using this simple framework often gets me results close to what I want. If you have any tips on how to do better, tell me on Twitter.

For example, this is a prompt that gave me great results in Craiyon.

'Cluttered house in the woods \| anime oil painting high resolution cottagecore ghibli inspired 4k'

![ghibli style house in the woods by Craiyon](/resources/ai-generated-images/ghibli-house-craiyon.png){: alt="" loading="lazy"}

As you can see, just appending _"\| oil painting high resolution 4k"_ will improve most of your results. You can then also add a style cue like 'Ghibli inspired', 'Giger' or 'Salvador Dali'.

Other DALL-E/craiyon prompt templates for future use:

- Pixar style 3D render of X
- Subdivision control mesh of X
- A photograph of X, 4k, detailed
- Low-poly render of X; high resolution, 4k
- A digital illustration of X, 4k, detailed, trending in artstation, fantasy vivid colors

That last one has worked well for me for almost any prompt that describes a simple static scene (like houses, cities, landscapes or interiors) or a single humanoid/animal/plant. You can append styles to these in the end too (Eldritch, disco, lo-fi, etc.).

## VQVAE (EleutherAI)

_Steampunk inventor's library \| Gorgeous digital painting with sober colours amazing art mesmerizing, captivating, artstation 3, cozy_

![image-1.png](/resources/ai-generated-images/image-1.png){: alt="" loading="lazy"}

mechanical clockwork flying machine renaissance \| Gorgeous digital painting with sober colours amazing art mesmerizing, captivating, artstation 3, realistic, render materials

![image-2.png](/resources/ai-generated-images/image-2.png){: alt="" loading="lazy"}


A beautiful painting of waves crashing on a cliff by Thomas Cole

![1640231078_A_beautiful_painting_of_waves_crashing_on_a_cliff_by_Thomas_Cole.jpg](/resources/ai-generated-images/1640231078_A_beautiful_painting_of_waves_crashing_on_a_cliff_by_Thomas_Cole.jpg){: alt="" loading="lazy"}

A beautiful painting of waves crashing on a cliff by Thomas Cole

![1640231297_A_beautiful_painting_of_an_Austrian_Palace_by_Thomas_Cole-cityscape.jpg](/resources/ai-generated-images/1640231297_A_beautiful_painting_of_an_Austrian_Palace_by_Thomas_Cole-cityscape.jpg){: alt="" loading="lazy"}


A glade under the stars \| Gorgeous digital painting with sober colours amazing art mesmerizing, captivating, artstation 3, cottagecore, cozy


![1640234361_A_glade_under_the_stars-Gorgeous_digital_painting_with_sober_colours_amazing_art_mesmerizing_capt.jpg](/resources/ai-generated-images/1640234361_A_glade_under_the_stars-Gorgeous_digital_painting_with_sober_colours_amazing_art_mesmerizing_capt.jpg){: alt="" loading="lazy"}

A disco coral reef underwater \| Gorgeous digital painting with aggressive colours amazing art mesmerizing, captivating, artstation 3, cozy, lo-fi

![1640234860_A_disco_coral_reef_underwater-Gorgeous_digital_painting_with_aggressive_colours_amazing_art_mesmer.jpg](/resources/ai-generated-images/1640234860_A_disco_coral_reef_underwater-Gorgeous_digital_painting_with_aggressive_colours_amazing_art_mesmer.jpg){: alt="" loading="lazy"}


The sunken city of R'lyeh lies dormant \| Breath-taking digital painting with dark colours amazing art mesmerizing, captivating, artstation 3, Lovecraftian, eldritch

![1640234962_The_sunken_city_of_Rlyeh_lies_dormant-Breath-taking_digital_painting_with_dark_colours_amazing_ar.jpg](/resources/ai-generated-images/1640234962_The_sunken_city_of_Rlyeh_lies_dormant-Breath-taking_digital_painting_with_dark_colours_amazing_ar.jpg){: alt="" loading="lazy"}

The white fox in the Arcadian praerie \| Breath-taking digital painting with vivid colours amazing art mesmerizing, captivating, artstation 3, japanese style

![1640235251_The_white_fox_in_the_Arcadian_praerie-Breath-taking_digital_painting_with_vivid_colours_amazing_ar.jpg](/resources/ai-generated-images/1640235251_The_white_fox_in_the_Arcadian_praerie-Breath-taking_digital_painting_with_vivid_colours_amazing_ar.jpg){: alt="" loading="lazy"}

The green idyllic Arcadian praerie with sheep \| Breath-taking digital painting with placid colours amazing art mesmerizing, captivating, artstation 3, cottagecore
A beautiful painting of the Garden of Eden by Thomas Cole

![1640235438_The_green_idyllic_Arcadian_praerie_with_sheep-Breath-taking_digital_painting_with_placid_colours_a.jpg](/resources/ai-generated-images/1640235438_The_green_idyllic_Arcadian_praerie_with_sheep-Breath-taking_digital_painting_with_placid_colours_a.jpg){: alt="" loading="lazy"}

### Biblical References

A beautiful painting of the Tower of Babel by Thomas Cole

![1640270061_A_beautiful_painting_of_the_Garden_of_Eden_by_Thomas_Cole.jpg](/resources/ai-generated-images/1640270061_A_beautiful_painting_of_the_Garden_of_Eden_by_Thomas_Cole.jpg){: alt="" loading="lazy"}

the Tower of Babel by beeple gurney richter \| 3D Depth Shader;special effects;production values;movie FX;VFX;sci-fi;4K resolution;high dynamic range;Dolby Vision;hdr10;atmos;3 dimensional;vray; ray tracing;hyperrealistic;

![1640270742_the_Tower_of_Babel_by_beeple_gurney_richter-3D_Depth_Shaderspecial_effectsproduction_valuesmovi.jpg](/resources/ai-generated-images/1640270742_the_Tower_of_Babel_by_beeple_gurney_richter-3D_Depth_Shaderspecial_effectsproduction_valuesmovi.jpg){: alt="" loading="lazy"}

the Garden of Eden by beeple gurney richter \| 3D Depth Shader;special effects;production values;movie FX;VFX;sci-fi;4K resolution;high dynamic range;Dolby Vision;hdr10;atmos;3 dimensional;vray; ray tracing;hyperrealistic;matte painting

![1640270435_the_Garden_of_Eden_by_beeple_gurney_richter-3D_Depth_Shaderspecial_effectsproduction_valuesmovi.jpg](/resources/ai-generated-images/1640270435_the_Garden_of_Eden_by_beeple_gurney_richter-3D_Depth_Shaderspecial_effectsproduction_valuesmovi.jpg){: alt="" loading="lazy"}

### Fantasy Prompts

A breath-taking painting of an eldritch beetle god that should not be by Thomas Cole \| old masters, artstation 3

![1640231439_A_breath-taking_painting_of_an_eldritch_beetle_god_that_should_not_be_by_Thomas_Cole-old_masters_.jpg](/resources/ai-generated-images/1640231439_A_breath-taking_painting_of_an_eldritch_beetle_god_that_should_not_be_by_Thomas_Cole-old_masters_.jpg){: alt="" loading="lazy"}

A breath-taking painting of Valkyries riding pegasi on the clouds over cliff by Thomas Cole \| old masters, artstation 3

![1640231675_A_breath-taking_painting_of_Valkyries_riding_pegasi_on_the_clouds_over_cliff_by_Thomas_Cole-old_ma.jpg](/resources/ai-generated-images/1640231675_A_breath-taking_painting_of_Valkyries_riding_pegasi_on_the_clouds_over_cliff_by_Thomas_Cole-old_ma.jpg){: alt="" loading="lazy"}

golden fae stands on flower at night \| Gorgeous digital painting with rich colours amazing art mesmerizing, captivating, artstation 3, cottagecore aesthetic

![image.png](/resources/ai-generated-images/image.png){: alt="" loading="lazy"}

Fae Blessing \| Breath-taking digital painting with placid colours amazing art mesmerizing, captivating, artstation 3

![1640276542_Fae_Blessing-Breath-taking_digital_painting_with_placid_colours_amazing_art_mesmerizing_captivati.jpg](/resources/ai-generated-images/1640276542_Fae_Blessing-Breath-taking_digital_painting_with_placid_colours_amazing_art_mesmerizing_captivati.jpg){: alt="" loading="lazy"}


![1640232053_A_painting_of_an_Eldrazi_God_with_a_nova_background_by_Thomas_Cole-artstation_3.jpg](/resources/ai-generated-images/1640232053_A_painting_of_an_Eldrazi_God_with_a_nova_background_by_Thomas_Cole-artstation_3.jpg){: alt="" loading="lazy"}


An etching of a Troll with a grin by Gustave Doré \| artstation 3

![1640233029_An_etching_of_a_Troll_with_a_grin_by_Gustave_Dore-artstation_3.jpg](/resources/ai-generated-images/1640233029_An_etching_of_a_Troll_with_a_grin_by_Gustave_Dore-artstation_3.jpg){: alt="" loading="lazy"}

A wood engraving of Goblins by Gustave Doré

![1640233240_A_wood_engraving_of_Goblins_by_Gustave_Dore.jpg](/resources/ai-generated-images/1640233240_A_wood_engraving_of_Goblins_by_Gustave_Dore.jpg){: alt="" loading="lazy"}

Refreshing composition, thick texture. Grotesque Centaur by Zdzisław Beksiński and Geiger inspired

![1640233456_Refreshing_composition_thick_texture-Grotesque_Centaur_by_Zdzisaw_Beksinski_and_Geiger_inspired.jpg](/resources/ai-generated-images/1640233456_Refreshing_composition_thick_texture-Grotesque_Centaur_by_Zdzisaw_Beksinski_and_Geiger_inspired.jpg){: alt="" loading="lazy"}

Grotesque Centaur by Zdzisław Beksiński and Geiger inspired
A centaur in a glade under the stars \| Gorgeous digital painting with sober colours amazing art mesmerizing, captivating, artstation 3, cottagecore, cozy

![1640233735_Grotesque_Centaur_by_Zdzisaw_Beksinski_and_Geiger_inspired.jpg](/resources/ai-generated-images/1640233735_Grotesque_Centaur_by_Zdzisaw_Beksinski_and_Geiger_inspired.jpg){: alt="" loading="lazy"}

fantasy tavern \| Breath-taking digital painting with warm colours amazing art mesmerizing, captivating, artstation 3, cottagecore

![1640277186_fantasy_tavern-Breath-taking_digital_painting_with_warm_colours_amazing_art_mesmerizing_captivati.jpg](/resources/ai-generated-images/1640277186_fantasy_tavern-Breath-taking_digital_painting_with_warm_colours_amazing_art_mesmerizing_captivati.jpg){: alt="" loading="lazy"}

fantasy tavern interior \| Breath-taking digital painting with warm colours amazing art mesmerizing, captivating, artstation 3

![1640277448_fantasy_tavern_interior-Breath-taking_digital_painting_with_warm_colours_amazing_art_mesmerizing_.jpg](/resources/ai-generated-images/1640277448_fantasy_tavern_interior-Breath-taking_digital_painting_with_warm_colours_amazing_art_mesmerizing_.jpg){: alt="" loading="lazy"}

fantasy tavern interior \| Breath-taking digital illustration with warm colours amazing art mesmerizing, captivating, artstation 3, D&D Style

![1640277481_fantasy_tavern_interior-Breath-taking_digital_illustration_with_warm_colours_amazing_art_mesmerizi.jpg](/resources/ai-generated-images/1640277481_fantasy_tavern_interior-Breath-taking_digital_illustration_with_warm_colours_amazing_art_mesmerizi.jpg){: alt="" loading="lazy"}

purple Fungi from Yuggoth \| Gorgeous digital painting with intense colours amazing art mesmerizing, captivating, artstation 3, thought-provoking, dark

![1640281351_purple_Fungi_from_Yuggoth-Gorgeous_digital_painting_with_intense_colours_amazing_art_mesmerizing_.jpg](/resources/ai-generated-images/1640281351_purple_Fungi_from_Yuggoth-Gorgeous_digital_painting_with_intense_colours_amazing_art_mesmerizing_.jpg){: alt="" loading="lazy"}

3D hyperrealistic materials and soft warm lighting \| 3d render amazing graphics shaders 4k UHD\| An amazing digital illustration depicting Archangel Michael spread enormous wings at night \| artstation 3, hyperrealist, realistic

![1640232675_3D_hyperrealistic_materials_and_soft_warm_lighting-3d_render_amazing_graphics_shaders_4k_UHD_An_a.jpg](/resources/ai-generated-images/1640232675_3D_hyperrealistic_materials_and_soft_warm_lighting-3d_render_amazing_graphics_shaders_4k_UHD_An_a.jpg){: alt="" loading="lazy"}

## DALL-E Mini

![dallemini_2022-7-5_15-38-42.png](/resources/ai-generated-images/dallemini_2022-7-5_15-38-42.png){: alt="" loading="lazy"}

![dallemini_2022-7-5_15-44-51.png](/resources/ai-generated-images/dallemini_2022-7-5_15-44-51.png){: alt="" loading="lazy"}

![dallemini_2022-7-5_15-47-52.png](/resources/ai-generated-images/dallemini_2022-7-5_15-47-52.png){: alt="" loading="lazy"}

![dallemini_2022-7-5_18-14-38.png](/resources/ai-generated-images/dallemini_2022-7-5_18-14-38.png){: alt="" loading="lazy"}

![dallemini_2022-6-28_20-23-36.png](/resources/ai-generated-images/dallemini_2022-6-28_20-23-36.png){: alt="" loading="lazy"}

![dallemini_2022-6-28_20-20-14.png](/resources/ai-generated-images/dallemini_2022-6-28_20-20-14.png){: alt="" loading="lazy"}

![dallemini_2022-6-28_20-21-57.png](/resources/ai-generated-images/dallemini_2022-6-28_20-21-57.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_0-19-26.png](/resources/ai-generated-images/dallemini_2022-6-29_0-19-26.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_0-27-2.png](/resources/ai-generated-images/dallemini_2022-6-29_0-27-2.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_2-56-55.png](/resources/ai-generated-images/dallemini_2022-6-29_2-56-55.png){: alt="" loading="lazy"}

![dallemini_2022-6-28_20-27-30.png](/resources/ai-generated-images/dallemini_2022-6-28_20-27-30.png){: alt="" loading="lazy"}

![dallemini_2022-6-28_20-31-26.png](/resources/ai-generated-images/dallemini_2022-6-28_20-31-26.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_2-59-32.png](/resources/ai-generated-images/dallemini_2022-6-29_2-59-32.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_3-3-45.png](/resources/ai-generated-images/dallemini_2022-6-29_3-3-45.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_3-2-3.png](/resources/ai-generated-images/dallemini_2022-6-29_3-2-3.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_14-30-15.png](/resources/ai-generated-images/dallemini_2022-6-29_14-30-15.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_2-59-23.png](/resources/ai-generated-images/dallemini_2022-6-29_2-59-23.png){: alt="" loading="lazy"}

![dallemini_2022-6-17_15-54-37.png](/resources/ai-generated-images/dallemini_2022-6-17_15-54-37.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_16-14-15.png](/resources/ai-generated-images/dallemini_2022-6-29_16-14-15.png){: alt="" loading="lazy"}

![dallemini_2022-6-17_18-15-1.png](/resources/ai-generated-images/dallemini_2022-6-17_18-15-1.png){: alt="" loading="lazy"}

![dallemini_2022-6-17_15-51-0.png](/resources/ai-generated-images/dallemini_2022-6-17_15-51-0.png){: alt="" loading="lazy"}

![dallemini_2022-6-29_14-38-38.png](/resources/ai-generated-images/dallemini_2022-6-29_14-38-38.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_15-46-26.png](/resources/ai-generated-images/dallemini_2022-6-18_15-46-26.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_16-6-12.png](/resources/ai-generated-images/dallemini_2022-6-18_16-6-12.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_15-58-12.png](/resources/ai-generated-images/dallemini_2022-6-18_15-58-12.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_15-42-38.png](/resources/ai-generated-images/dallemini_2022-6-18_15-42-38.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_16-11-16.png](/resources/ai-generated-images/dallemini_2022-6-18_16-11-16.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_20-49-47.png](/resources/ai-generated-images/dallemini_2022-6-18_20-49-47.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_16-23-50.png](/resources/ai-generated-images/dallemini_2022-6-18_16-23-50.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_16-31-15.png](/resources/ai-generated-images/dallemini_2022-6-18_16-31-15.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_20-41-34.png](/resources/ai-generated-images/dallemini_2022-6-18_20-41-34.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_16-35-53.png](/resources/ai-generated-images/dallemini_2022-6-18_16-35-53.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-21-57.png](/resources/ai-generated-images/dallemini_2022-6-23_0-21-57.png){: alt="" loading="lazy"}

![dallemini_2022-6-18_21-3-57.png](/resources/ai-generated-images/dallemini_2022-6-18_21-3-57.png){: alt="" loading="lazy"}

![dallemini_2022-6-22_12-18-38.png](/resources/ai-generated-images/dallemini_2022-6-22_12-18-38.png){: alt="" loading="lazy"}

![dallemini_2022-6-22_11-50-10.png](/resources/ai-generated-images/dallemini_2022-6-22_11-50-10.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-36-27.png](/resources/ai-generated-images/dallemini_2022-6-23_0-36-27.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-47-9.png](/resources/ai-generated-images/dallemini_2022-6-23_0-47-9.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-26-39.png](/resources/ai-generated-images/dallemini_2022-6-23_0-26-39.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-38-59.png](/resources/ai-generated-images/dallemini_2022-6-23_0-38-59.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-33-40.png](/resources/ai-generated-images/dallemini_2022-6-23_0-33-40.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_0-54-37.png](/resources/ai-generated-images/dallemini_2022-6-23_0-54-37.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_1-57-32.png](/resources/ai-generated-images/dallemini_2022-6-23_1-57-32.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_1-9-58.png](/resources/ai-generated-images/dallemini_2022-6-23_1-9-58.png){: alt="" loading="lazy"}

![dallemini_2022-6-23_1-3-0.png](/resources/ai-generated-images/dallemini_2022-6-23_1-3-0.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-40-42.png](/resources/ai-generated-images/dallemini_2022-7-10_23-40-42.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-40-34.png](/resources/ai-generated-images/dallemini_2022-7-10_23-40-34.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-42-24.png](/resources/ai-generated-images/dallemini_2022-7-10_23-42-24.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-42-58.png](/resources/ai-generated-images/dallemini_2022-7-10_23-42-58.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-8.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-8.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-15.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-15.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-20.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-20.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-29.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-29.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-34.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-34.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-38.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-38.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-46-46.png](/resources/ai-generated-images/dallemini_2022-7-10_23-46-46.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-48-26.png](/resources/ai-generated-images/dallemini_2022-7-10_23-48-26.png){: alt="" loading="lazy"}

![dallemini_2022-7-10_23-48-31.png](/resources/ai-generated-images/dallemini_2022-7-10_23-48-31.png){: alt="" loading="lazy"}
