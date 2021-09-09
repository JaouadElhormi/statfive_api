DROP DATABASE IF EXISTS `statfive`;
CREATE SCHEMA `statfive`;

use statfive;

CREATE TABLE `match_played` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `ground` int(11) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kilometre` int(11) DEFAULT NULL,
  `passe` int(11) DEFAULT NULL,
  `but` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `team_has_match_played` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `goals` int(3) NOT NULL,
  `possesion` float NOT NULL,
  `color` varchar(10) NOT NULL,
  `ended` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `team_stats` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `but` int(11) NOT NULL,
  `passe` int(11) NOT NULL,
  `km` float NOT NULL,
  `possesion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user_has_team` (
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour la table `match_played`
--
ALTER TABLE `match_played`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userstat` (`user_id`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `team_has_match_played`
--
ALTER TABLE `team_has_match_played`
  ADD KEY `matchid` (`match_id`),
  ADD KEY `teamid` (`team_id`);

--
-- Index pour la table `team_stats`
--
ALTER TABLE `team_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teamstats` (`team_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_has_team`
--
ALTER TABLE `user_has_team`
  ADD KEY `team` (`team_id`),
  ADD KEY `user` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `match_played`
--
ALTER TABLE `match_played`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `team_stats`
--
ALTER TABLE `team_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `stats`
--
ALTER TABLE `stats`
  ADD CONSTRAINT `userstat` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `team_has_match_played`
--
ALTER TABLE `team_has_match_played`
  ADD CONSTRAINT `matchid` FOREIGN KEY (`match_id`) REFERENCES `match_played` (`id`),
  ADD CONSTRAINT `teamid` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Contraintes pour la table `team_stats`
--
ALTER TABLE `team_stats`
  ADD CONSTRAINT `teamstats` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Contraintes pour la table `user_has_team`
--
ALTER TABLE `user_has_team`
  ADD CONSTRAINT `team` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;
