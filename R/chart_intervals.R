source("R/set_up.R")
source("R/style.R")


#DATA FOR INTERVALS


#Clean data
data_segment_raw = import(file.path(dir_data, "data_for_segment.xlsx")) %>%
  select(-ID_Number, -Nome) %>%
  pivot_longer(cols = names(.)) %>%
  group_by(name) %>%
  #Estimate mean, sd, n, and errors
  summarise(mean = mean(value,na.rm = T),
            sd = sd(value, na.rm = T),
            n = sum(!is.na(value)),
            left = mean - 1.96 * sd,
            right = mean + 1.96 * sd,
            .groups = 'drop') %>%
  mutate(round = factor(if_else(str_detect(name,"_1"), "Endline", "Base line")),
         name = factor(case_when(str_detect(name, "Argumenta") ~ "Argumentação Lógica" ,
                                 str_detect(name, "Linguagem") ~ "Linguagem Corporal",
                                 str_detect(name, "Boas") ~ "Boas Maneiras",
                                 str_detect(name, "Auto") ~ "Auto confiança"
                                 
         ))) 




## Plot of intervals
plot_intervals = ggplot(data = data_segment_raw,
                        aes(color = round)) +
  geom_point(aes(y = round,
                 x = mean,
                 color = round)) +
  geom_segment(aes(x=left,
                   xend = right,
                   y = round,
                   yend = round)) +
  facet_wrap(~name, ncol = 1) +
  labs(x = "Score",
       y = "") +
  scale_color_manual(name = "", values = c(purple_MUVA, orange_MUVA)) +
  scale_x_continuous(labels = c("1","2","3","4","5","")) +
  tema +
  theme(strip.text.y = element_text(angle = 180, color = darkblue),
        strip.background =element_rect(fill=blue_lightest),
        axis.text.y=element_blank(),
        axis.line.y = element_blank())



ggsave(file.path(dir_charts,"intervals.png"),plot_intervals )