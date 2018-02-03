# Project Araminta

This is a project to create a stamp of Harriet Tubman that can effectively overlay Andrew Jackson's portrait on the US $20 bill, inspired by a design seen in photographs from an [Adafruit article][] on the subject, attached to a tutorial on making portrait stamps in general.

[Adafruit article]: https://blog.adafruit.com/2017/10/12/turn-your-20s-into-tubmans-with-this-diy-3-d-printed-stamp-wired-adafruit-ustreasury-stevenmnuchin1/

Adafruit's posted tutorial contains the source files for *a* stamp of Harriet Tubman. The [stamp depicted in their blog post][fancy stamp] announcing their tutorial (and echoed in [WIRED][]), however, is not the same as the one whose files are provided in the tutorial (as you can see from [the stamped specimen][], it features a full bust of Tubman covering up Jackson's portrait with "TUBMAN" lettering to overwrite the "JACKSON" beneath the portrait, along with the outline of the stamp being an alignment guide for overlaying Jackson's silhouette).

[fancy stamp]: https://cdn-blog.adafruit.com/uploads/2017/10/IMG_5904-1.jpg
[WIRED]: https://www.wired.com/story/stamp-puts-harriet-tubmans-face-on-a-20-dollar-bill/
[the stamped specimen]: https://media.wired.com/photos/59de7f83f3a29d1c2899b7f9/master/w_limit,c_limit/tubman-IL.jpg

My motto is, "if the source isn't available, remake it better", so that's the aim of this project: to recreate this design in a fully [SACRED][] manner, suitable for reproducing, remaking, and remixing.

[SACRED]: https://github.com/stuartpb/sacred-tenets

## Name

The name "Project Araminta" comes from [Tubman's birth name, Araminta "Minty" Ross][Wikipedia]. It also sounds like "our Mint", which gestures toward one of the goals of this project: to, as the US mint drags its heels on enacting its plans, take matters into the people's hands.

[Wikipedia]: https://en.wikipedia.org/wiki/Harriet_Tubman#Birth_and_family

## Legality

**Stamping your money with Harriet Tubman's face is perfectly legal.** [Adafruit's writeup on the subject][Adafruit legality article]  goes into exhaustive detail, indentifying all relevant statutes and precedents.

[Adafruit legality article]: https://blog.adafruit.com/2017/10/15/hey-steven-mnuchin-making-harriet-tubman-20s-seems-totally-ok-ustreasury-stevenmnuchin1/

## Artifacts

This project uses a few non-procedural assets to assemble the finished product:

### The Tubman portrait

The portrait of Harriet Tubman on the stamp comes from [a recently-discovered photograph of Tubman][Smithsonian] in her youth. Finding a high-resolution image file of this photograph is not as simple as it should be: there is [an instance of the Associated Press scan of the portrait on Wikimedia Commons][Wikimedia Commons], but it's grossly overscaled from the image's original resolution (2100x3300, according to [the image's Exif data][metadata]), probably to compensate for having been downscaled from wherever it was originally obtained (even when rescaled to the original resolution, many details are blurry).

[Smithsonian]: https://www.smithsonianmag.com/smart-news/smithsonian-library-of-congress-rare-1860s-photo-harriet-tubman-180962818/
[Wikimedia Commons]: https://commons.wikimedia.org/wiki/File:Harriet_Tubman_c1868-69.jpg
[metadata]: https://commons.wikimedia.org/wiki/File:Harriet_Tubman_c1868-69.jpg#Metadata

To make the portrait seen here, I took the overscaled version of the portrait from Wikimedia Commons, opened it in GIMP, Desaturated it by Luminosity, and Thresholded it (with a lower bound of 120). I then converted that image to an SVG via https://tracercore.com/, using an `ltres` of 5, a `qtres` of 10, and a `strokewidth` of 0 (along with the obvious settings that should be set to use a palette of black and white, ie. setting `numberofcolors` to 2). I then imported this to Inkscape, where I transformed it appropriately to fit Jackson's portrait on the 20, relative to the coordinate space established by jackson-silhouette.svg.

### The "TUBMAN" Copperplate

`tubman-copperplate.svg` is a wordmark to replace the "JACKSON" banner at the bottom of the portrait: as there's no open-licensed digitization of [Copperplate Gothic][] that I could find, I've just included the paths of the glyphs here. (If you wish to make your own variation of this, some manner of Copperplate Gothic for "personal use" shouldn't be too hard to find: I think Microsoft includes copies of it in redistributables like the viewers for Office files, or PowerPoint presentations, or their "web font" bundle.)

[Copperplate Gothic]: https://en.wikipedia.org/wiki/Copperplate_Gothic

### The Jackson silhouette

The Jackson silhouette included here was obtained by doing a union on the paths of a portrait of Jackson from some clipart obtained via some shady rehosting site that I'm not going to link to here (which was then run through an online EPS-to-SVG converter, since I couldn't easily get anything on my machine to convert it neatly), claiming that the image was public domain. I just as easily could have traced this myself (and, as it's based on a work of the US government, should be a fair-use derivative anyway); this mostly just saved me the fretting that I would otherwise be prone to over things like how much detail to put into each individual hair of the silhouette.

## Rendering Models

The `tubman20-stamp.scad` file currently present in the repository specifies a printable stamp pad. (Further models, such as a stamp handle and mold, will be generated in later iterations.)

This design relies upon importing SVGs into OpenSCAD, which is [an experimental feature at time of writing][openscad/openscad#1740]: to use it, you'll need to download [a development snapshot of OpenSCAD][snapshots], then enable SVG import under Edit -> Preferences -> Features (or pass `--enable=svg-import`, for command line usage).

[openscad/openscad#1740]: https://github.com/openscad/openscad/issues/1740
[snapshots]: http://www.openscad.org/downloads.html#snapshots

## Testing and Iterating

Rather than printing molds, as described in the Adafruit tutorial, I'm printing the prototype stamps directly in TPU. For stamping, I'm then affixing them to a cork with double-stick tape.

Since I don't have an endless supply of $20 bills (and washable ink neither adsorbs well onto TPU, nor washes easily off of money), I'm testing the stamp by printing the portrait from [this scan of a $20 bill obverse on Wikimedia Commons][Series 2006 Obverse] on my [Brother QL-700][] label printer (the only "paper" printer I have) on cheap DK-2205 knockoff label paper (one of the nice things about Brother label printers is that, for the more common paper types, there are *lots* of generics available), laid out in the [P-touch Editor][] software rotated 90 degrees at a size of 2.61 inches tall/wide and -0.08 inches horizontally, and with a brightness of 25% and a contrast of 100%. (I've cropped the bill to just the portrait using the software's "Trimming" feature; the extents that I cropped it to weren't particularly careful, just any points along the bill that are wide enough to include the stamped area of Jackson's portrait without wasting paper.)

[Series 2006 Obverse]: https://commons.wikimedia.org/wiki/File:US_$20_Series_2006_Obverse.jpg
[Brother QL-700]: http://m.brother-usa.com/labelprinter/modeldetail/23/ql700/overview
[P-touch Editor]: http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=lpql700eus
