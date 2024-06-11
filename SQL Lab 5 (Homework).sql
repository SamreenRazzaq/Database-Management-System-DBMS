--Consider the following query:

SELECT DISTINCT author.name
FROM `bigquery-public-data.github_repos.commits` commits_1
WHERE (SELECT COUNT(*)
FROM `bigquery-public-data.github_repos.commits` commits_2
WHERE commits_1.author.name = commits_2.author.name) > 20;


-- (c) More efficient version of above query:

SELECT author.name
FROM `bigquery-public-data.github_repos.commits`
GROUP BY author.name
HAVING COUNT(*) > 20;
