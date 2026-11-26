---
tags:
  - notes
  - 2026-11-26
---

# 2026-11-26

- Date: 2026-11-26
- Lead discussion: Richel Bilderbeek
- Paper: Matteucci, M.C., Guglielmi, D. & Lauermann, F. Teachers' sense of
  responsibility for educational outcomes and its associations with teachers'
  instructional approaches and professional wellbeing. Soc Psychol Educ 20,
  275–298 (2017). [DOI](https://doi.org/10.1007/s11218-017-9369-y)


## Discussion

Talk: why I chose this paper

???- question "Answers"

    I wanted to know if reading the literature to improve teaching is worth it:
    to which extent does it make one a better teacher.


???- question "Questions I will ask as an easy copy-paste"


    ```text
    1. What grade on a scale from 1 (worst) to 10 (best) 
       would you give this paper?
    2. How would you summarize this paper in one line?
    3. How would you praise the paper?
    4. How would you criticise the paper?
    5. Do you believe that we should do what this paper advises?
    6. How does this paper make us better teachers?
    ```

What grade on a scale from 1 (worst) to 10 (best) would you give this paper?

???- question "Answers"

    - R: 5
    - ...
    - ...


How would you summarize this paper in one line?

???- question "Answers"

    - R: Teachers feeling responsible has some effects on some things

How would you praise the paper?

???- question "Answers"

    - R: I enjoyed the introduction, method and the figure the methods produced.
    - ...
    - ...
    - ...

How would you criticise the paper?

???- question "Answers"

    - R: The data, nor the data analysis scripts are not available for download.
      Using a p-value of 0.1 to get 'a result' feels dishonest to me.
    - ...
    - ...
    - ...

<!-- Extra question -->
Do you feel the findings are relevant, i.e. do you feel the
effect sizes are big enough to matter?

???- question "Figure 1 different"

    This version has:

    - the 0.1 < p < 0.05 values removed
    - the 0.05 < p < 0.01 values in grey
    - the 0.01 < p < 0.001 values in dashed black
    - the p < 0.001 values in solid black

    <!-- markdownlint-disable MD013 --><!-- Mermaid cannot be split up over lines, hence will break 80 characters per line -->

    ```mermaid
    flowchart LR
        %% Nodes
        SE["Teacher<br/>Self-efficacy"]
        IT["Incremental<br/>Theory"]
        SC["School Climate:<br/>Relationships with Students"]
        
        TR["Teacher Responsibility<br/>(R² = .11)"]
        
        MP["Mastery Practices<br/>(R² = .16)"]
        CS["Career-choice Satisfaction<br/>(R² = .10)"]
        WE["Work Engagement<br/>(R² = .13)"]

        %% Solid lines (p <= 0.001, black, value retained)
        SE -->|.26| TR
        SE -->|.28| MP
        CS <-->|.40| WE

        %% Dotted lines (p: 0.01 - 0.001, dark gray, value retained)
        TR -...->|.20| MP
        SE -...->|.16| WE
        SC -...->|.19| CS
        SC -...->|.20| WE

        %% Dashed lines (p: 0.05 - 0.01, light gray, value retained)
        IT -.->|.13| TR
        SC -.->|.13| TR
        TR -.->|.18| CS
        TR -.->|.15| WE
        IT -.->|.11| WE
        SE <-.->|.12| SC

        %% Renderer Link Styling Rules
        %% Solid links (0, 1, 2) - Black
        linkStyle 0,1,2 stroke:#000000,stroke-width:2.5px;
        %% Dotted links (3, 4, 5, 6) - Dark Gray (#444444)
        linkStyle 3,4,5,6 stroke:#444444,stroke-width:2px,stroke-dasharray:6 6;
        %% Dashed links (7, 8, 9, 10, 11, 12) - Light Gray (#aaaaaa)
        linkStyle 7,8,9,10,11,12 stroke:#ddd,stroke-width:1.5px,stroke-dasharray:6 6;
    ```

    <!-- markdownlint-enable MD013 -->

???- question "Answers"

    - R: I struggle with seeing this. 
      E.g. 'Incremental theory' is put on a six-point Likert scale,
      ranging from 1 (strongly agree) to 6 (strongly disagree).
      Also, 'Teacher Responsibility' is put on a six-point Likert scale,
      ranging from 0 (not at all) to 6 (completely) <!-- isn't that 7? -->
      The effect size of IT to TR is 0.13. This means that a teacher
      that fully believes in IT, he/she feels (`0.13 * 5 =`) 0.65 more
      responsibility. 
      If we center this increase around the mean TR of 4.53
      (as given in that same table),
      then TR goed up from (`4.53 - (0.65 / 2) =`) 4.205 
      to (`4.53 + (2.265 / 2) =`) 4.855.
      This is an increase of (`4.855 - 4.205 / 4.205 =`) 15%
      between the extremes. 
      Is that a lot?
    - ...
    - ...
    - ...


<!-- Extra question -->
Do you feel that we are formally/professionally responsible
for the learning of our participants? Why?

???- question "Answers"

    - R: Yes, get our learners to learn **is** the measure of successful
      teaching. Have an idea of how many actually do so is a vital indicator,
      even though 100% will not always be achieved with perfect teaching.
    - ...
    - ...
    - ...

<!-- Extra question -->
Do you feel that feeling formally/professionally responsible
for the learning of our participants is worth it? Why?

???- question "Answers"

    - R: Yes. Helping scientists do their work makes the world a better place
    - ...
    - ...
    - ...

<!-- Extra question -->
Assuming taking responsibility is important for better teaching,
could it be that we do not need to take responsibility anyways,
as we get away with worse teaching (as compared to other settings)?

???- question "Answers"

    - R: Yes. I think there are multiple ways why we get away with worse
      teaching. One of the reasons is that we are mild to our
      beginner teachers; they are in the majority.
      Additionally, our teachers have many other duties too,
      hence we should be thankful to their time teaching.
      Already these things make it possible to get away with worse teaching.
    - ...
    - ...
    - ...


Do you believe that we should do what this paper advises?

???- question "Answers"

    - R: This paper gives no advice, it only charts what is there
    - ...
    - ...
    - ...


How does this paper make us better teachers?

???- question "Answers"

    - R: There is no need to feel personally responsible: the effect is mild.
    - ...
    - ...
    - ...


##

Even though this paper plots the relationships between some things,
it does not answer the question: 'Are we responsible for the
learning or motivation of our participants?'.

On the other hand, you could say, following this paper: 'No, we
only have our formal responsibilities'. I have scanned the SLL and NBIS
Training Hubs and could not find any document to state we need to do more.

> Motivating the learner to learn is pertinent to curriculum implementation.
> This is because motivation is an influential factor in the
> teaching-learning situations.
> The success of learning depends on whether or not the learners are motivated.
> Motivation drives learners in reaching learning goals.
> It is important to recognize the fact that motivating learning is a central
> element of good teaching `[Filgona et al., 2020]`


## Scribbles 1

```mermaid
flowchart TD
  
  formal_responsibility
  personal_responsibility
  formal_responsibility --> |May be extended by| personal_responsibility
  personal_responsibility -.- personal_responsibility_predictors
  self_efficacy
  self_efficacy <--> |Independent|personal_responsibility
  instructional_approaches
  wellbeing
  personal_responsibility_predictors --> |Effect on| instructional_approaches
  personal_responsibility_predictors --> |Effect on| wellbeing

  personal_responsibility --> |Correlates with| work_engagement
  personal_responsibility --> |Correlates with| job_satisfaction
  personal_responsibility --> |Correlates with| endorse_mastery_oriented_instructional_practices
```

- Efficacy: well something works, i.e. how well it produces the intended result.
  For example: 'one-on-one teaching has a higher efficacy in producing high
  grades than classroom teaching'
- Mastery-goal classroom structure: a learning environment that emphasizes
  understanding, improvement, and developing skills, i.e.
  competition with self, not others

My questions:

- Why is it important that teachers feel responsible beyond their formal duties?
  Why are the formal duties not extended instead?


What is this text below..?

> Expanding upon previous qualitative research, which had used
> teacher interview data (Lautheir general choiceermann 2014)


Teacher Responsibility Scale (TRS, Lauermann and Karabenick 2013)
has four domains:

- responsibility for student motivation
- student achievement
- relationships with students
- (responsibility for) teaching

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

| Aspect                           |    1    |     2     |    3    |    4    |     5     |     6     |     7     |    8    |     9     |
|:-------------------------------- |:-------:|:---------:|:-------:|:-------:|:---------:|:---------:|:---------:|:-------:|:---------:|
| 1. Responsibility                |    /    |  **.29**  |   .17   |   .18   |  **.24**  |  **.25**  |  **.30**  |         |    -.21   |
| 2. Self-efficacy                 |         |     /     |         |         |    .18    |  **.24**  |  **.34**  |         |           |
| 3. Incremental theory            |         |           |    /    |         |           |    .18    |    .17    |         |           |
| 4. Relationships with students   |         |           |         |    /    |  **.23**  |  **.25**  |           |         |           |
| 5. Career-choice satisfaction    |         |           |         |         |     /     |  **.47**  |  **.21**  |         |           |
| 6. Work engagement               |         |           |         |         |           |     /     |  **.24**  |         |           |
| 7. Mastery practices             |         |           |         |         |           |           |     /     |         |           |
| 8. Age                           |         |           |         |         |           |           |           |    /    |  **.75**  |
| 9. Teaching experience           |         |           |         |         |           |           |           |         |     /     |

<!-- markdownlint-enable MD013 -->

> Top part of Table 1 from Matteucci, Guglielmi, & Lauermann (2017),
> presenting bivariate correlations between the 9 aspects.
> Values with **p < 0.001** are rendered in **bold**.
> Values with **p < 0.01** are rendered in normal text.


Mastery learning has an effect size of 0.57 [John Hattie]

## Scribbles 2

<!-- markdownlint-disable MD013 --><!-- Not now ... -->

Imagine a teacher that teaches short workshops in higher education. Imagine that that teacher has the view that the learners are the sole responsible for their learning (i.e. the teacher has no responsibility to motivate the learners). Which papers investigate such a teacher's view? Is there a name for such a view on teaching? What causes such a view on teaching?

The closest name is a teacher-centered, transmission view; it treats learner autonomy as mainly the student's job.
The papers split into three parts: which studies examine this view, what the view is usually called, and what seems to produce it.

Papers Investigating It

No paper here studies exactly the extreme claim that teachers have no responsibility to motivate learners, but several investigate closely related beliefs in higher education.

- Borg, S., & Alshumaimeri, Y. (2017). Language learner autonomy in a tertiary context: Teachers' beliefs and practices. Language Teaching Research, 23, 38 - 9. <https://doi.org/10.1177/1362168817725759>
- Lauermann, F., & Berger, J.-L. (2021). Linking teacher self-efficacy and responsibility with teachers' self-reported and student-reported motivating styles and student engagement. Learning and Instruction, 101441. <https://doi.org/10.1016/j.learninstruc.2020.101441>
- Russell, J. M., Baik, C., Ryan, A., & Molloy, E. (2020). Fostering self-regulated learning in higher education: Making self-regulation visible. Active Learning in Higher Education, 23, 97 - 113. <https://doi.org/10.1177/1469787420982378>

The clearest direct match is work on learner autonomy beliefs, where teachers often define autonomy as students taking responsibility and control with little teacher involvement, and many explain weak autonomy mainly by student deficits such as low motivation or poor learning skills.

- Borg, S., & Alshumaimeri, Y. (2017). Language learner autonomy in a tertiary context: Teachers' beliefs and practices. Language Teaching Research, 23, 38 - 9. <https://doi.org/10.1177/1362168817725759>

Several higher-education studies examine teacher-centered or transmission conceptions in which the teacher's role is to impart information and student sense-making is left largely to students.

- Päuler-Kuppinger, L., & Jucks, R. (2017). Perspectives on teaching: Conceptions of teaching and epistemological beliefs of university academics and students in different domains. Active Learning in Higher Education, 18, 63 - 76. <https://doi.org/10.1177/1469787417693507>
- Rozhenkova, V., Snow, L., Sato, B. K., Lo, S. M., & Buswell, N. (2023). Limited or complete? Teaching and learning conceptions and instructional environments fostered by STEM teaching versus research faculty. International Journal of STEM Education, 10, 1-20. <https://doi.org/10.1186/s40594-023-00440-9>
- Kember, D. (1997). A reconceptualisation of the research into university academics' conceptions of teaching. Learning and Instruction, 7, 255-275. <https://doi.org/10.1016/s0959-4752(96)00028-x>
- Prosser, M., & Trigwell, K. (2014). Qualitative variation in approaches to university teaching and learning in large first-year classes. Higher Education, 67, 783-795. <https://doi.org/10.1007/s10734-013-9690-0>

The limited-to-complete continuum of teaching conceptions is summarized visually in a department-level figure showing how limited conceptions align with instructor-centered environments.

![Figure from Rozhenkova et al., 2023](rozhenkova_et_al_2023_fig_1.png)

- Rozhenkova, V., Snow, L., Sato, B. K., Lo, S. M., & Buswell, N. (2023). Limited or complete? Teaching and learning conceptions and instructional environments fostered by STEM teaching versus research faculty. International Journal of STEM Education, 10, 1-20. <https://doi.org/10.1186/s40594-023-00440-9>

## References

- `[Filgona et al., 2020]` Filgona, J., Sakiyo, J., Gwany, D. M., & Okoronka, U. A. (2020). Motivation in Learning. Asian Journal of Education and Social Studies, 10, 16-37. <https://doi.org/10.9734/ajess/2020/v10i430273>
