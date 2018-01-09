(ns transaction-tracker.transactions
  (:require [om.core :as om :include-macros true]
            [om.dom :as dom :include-macros true]
            [transaction-tracker.utils :as utils]))

(defn item [transaction]
  (om/component
    (dom/tr nil
      (dom/td nil (:id transaction))
      (dom/td nil (str " " (:name transaction)))
      (dom/td nil (str " " (utils/as-currency (:amount transaction)))))))

(defn transaction-list [transactions]
  (om/component
   (apply dom/table #js {:style #js {:text-align "left"}}
     (dom/tr nil
       (dom/th nil "Id")
       (dom/th nil "Name")
       (dom/th nil "Amount"))
     (om/build-all item transactions))))
