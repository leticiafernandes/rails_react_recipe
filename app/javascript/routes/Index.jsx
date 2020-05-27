import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Recipes from "../components/Recipes";
import Recipe from "../components/Recipe";

const Index = () => (
    <Router>
        <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/recipes" exact component={Recipes} />
            <Route path="/recipe/:id" exact component={Recipe} />
        </Switch>
    </Router>
);

export default Index;