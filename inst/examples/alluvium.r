# basic flows (alluvia)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq, axis1 = Class, axis2 = Sex)) +
  geom_alluvium()

# use of facets
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium(aes(fill = Age, alpha = Sex)) +
  facet_wrap(~ Survived, scales = "free_y")

# declaration of groups (ignored)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq, axis1 = Class, axis2 = Sex, group = Survived)) +
  geom_alluvium()

# degeneracy (one axis; unavailable through shortcut function)
ggplot(as.data.frame(Titanic), aes(weight = Freq, axis = Class)) +
  geom_alluvium(aes(fill = Class, color = Survived)) +
  scale_color_manual(values = c("black", "white"))

# degeneracy (no axis)
if (FALSE) {
  ggplot(as.data.frame(Titanic), aes(weight = Freq)) +
    geom_alluvium(aes(fill = Class, color = Survived)) +
    scale_color_manual(values = c("black", "white"))
}

# control of horizontal spacing
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age, axis4 = Survived)) +
  geom_alluvium(aes(fill = Age),
                axis_width = 1/5, ribbon_bend = 1/3)

# control of axis positions (ridiculous syntax)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis1.5 = Age, axis2.5 = Sex, axis3 = Survived)) +
  geom_alluvium(aes(fill = Age))

# use of annotation and labels
ggplot(as.data.frame(Titanic),
       aes(weight = Freq, axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium() +
  geom_text(stat = "stratum") +
  ggtitle("Alluvial diagram of Titanic passenger demographic data") +
  scale_x_continuous(breaks = 1:3, labels = c("Class", "Sex", "Age"))

# combining flows and boxes
ggplot(as.data.frame(UCBAdmissions),
       aes(weight = Freq, axis1 = Gender, axis2 = Dept)) +
  geom_alluvium(aes(fill = Admit)) +
  geom_stratum() + geom_text(stat = "stratum")
