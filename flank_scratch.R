library(GenomicRanges)
library(ggbio)

#Functions to manipulate GRanges (Do not run!)

# shift(x, shift = 0L)
# narrow(x, start = NA, end = NA, width = NA)
# resize(x, width = NA, fix = ("start"/"end"))
# flank(x, width = NA, start = TRUE, both = FALSE, use.names = TRUE, ignore.strand = FALSE)


#Data to play with
gr <- GRanges(seqnames = rep("chr1", 3),
              ranges = IRanges(start = c(5,13,25), width = 5),
              strand = c("+", "+", "-"))

autoplot(gr)

gr2 <- GRanges(seqnames = rep("chr1", 6),
               ranges = IRanges(start = c(5,14,15,15,16,25), width = 3),
               strand = c("-", rep("+", 4), "-"))

autoplot(gr2)

grl <- GRangesList(gr, gr2)

autoplot(grl)

#Flank returns the positions directly upstream (+/-) of your range
gr
up1 <- flank(gr, 1)
up1
autoplot(GRangesList(gr, up1))

autoplot(flank(grl, 1))

#We can use flank to give up even more positions by increasing the width
gr
up3 <- flank(gr, 3)
up3
autoplot(GRangesList(gr, up3, up1))

#we can get flanking after the range
gr
down1 <- flank(gr, 1, start = FALSE)
down1
autoplot(GRangesList(gr, down1))
autoplot(GRangesList(gr, down1, up1))

#We can also use to get the beginning position
gr
start <- flank(gr, -1, start=TRUE, both=FALSE)
start
autoplot(GRangesList(gr, start))

#How does that work?
gr
inside3 <- flank(gr, -3)
inside3
autoplot(GRangesList(gr, inside3))

autoplot(GRangesList(gr, up1, up3, start, inside3, down1))
