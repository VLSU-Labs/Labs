﻿using System;
using System.Collections.Generic;

namespace Library.Views
{
    /// <summary>
    /// Представляет базовое представление основанное на массиве ребер.
    /// </summary>
    /// <typeparam name="TView">Тип представления графа.</typeparam>
    public abstract class EdgesView<TViewItem, TValue> : GraphView<TViewItem, TValue>
        where TViewItem : IEdgeViewItem<TValue>
        where TValue : IEquatable<TValue>, IComparable<TValue>
    {
        public EdgesView(IEnumerable<TViewItem> items)
            :base(items) { }
    }
}