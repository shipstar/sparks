(ns transaction-tracker.core
  (:require [om.core :as om :include-macros true]
            [om.dom :as dom :include-macros true]
            [transaction-tracker.transactions :as transactions]))

(enable-console-print!)

(def app-state
  (atom
    {:transactions
      [{:id 1, :amount 50, :name "Best Buy"}
       {:id 2, :amount 9.23, :name "Five Guys"}]}))

(defn header [app]
  (om/component
    (dom/h1 nil "Transaction Tracker")))

(defn main [app]
  (om/component
    (dom/div nil
      (om/build header app)
      (om/build transactions/transaction-list (:transactions app)))))

(om/root main app-state
  {:target (. js/document (getElementById "main"))})
